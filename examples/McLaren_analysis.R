data(mclaren_1994_f03)
mixturedata<-mclaren_1994_f03

# sort data by species
canis <- mixturedata[mixturedata$Species=="Canis lupus",]
fir <- mixturedata[mixturedata$Species=="Abies balsamea (east)",] # east firs
alces <- mixturedata[mixturedata$Species=="Alces alces",]

# fill in missing years
fir[35:36,1:7] <- NA 
#get time-lagged observations for each species
canis_lagged<-get_lag(x = canis$individuals, time = mixturedata$year)
alces_lagged<-get_lag(x = alces$individuals, time = mixturedata$year)
fir_lagged <-get_lag(x = fir$width, time = mixturedata$year)

# calculate per-capita growth rates
canis_dNNdt<-percap_growth(x = canis_lagged$x, laggedx = canis_lagged$laggedx, dt = canis_lagged$dt)
alces_dNNdt<-percap_growth(x = alces_lagged$x, laggedx = alces_lagged$laggedx, dt = alces_lagged$dt)
fir_dNNdt<-percap_growth(x = fir_lagged$x, laggedx = fir_lagged$laggedx, dt = fir_lagged$dt)

# fit linear models to dNNdt, based on average
# abundances between current and lagged time steps

# canis - alces
canis_mod_dat<-data.frame(canis_dNNdt=canis_dNNdt, canis=canis_lagged$laggedx, alces=alces_lagged$laggedx)
mod_comp_canis<-lm(canis_dNNdt~canis+alces, data=canis_mod_dat)

#alces - canis
alces_mod_dat<-data.frame(alces_dNNdt=alces_dNNdt, alces=alces_lagged$laggedx, canis=canis_lagged$laggedx, 
                          canis=canis_lagged$laggedx)
mod_comp_alces<-lm(alces_dNNdt~alces+canis, data=alces_mod_dat)
alces_mod_dat$fir<-fir_lagged$laggedx

# indirect effect of fir to canis - model fir seperatly with residuals of alces mod
ps=is.finite(alces_mod_dat$alces_dNNdt) & is.finite(alces_mod_dat$canis) & is.finite(alces_mod_dat$alces)
mod_comp_alces2<-lm(resid(mod_comp_alces)~-1+fir, data=alces_mod_dat[ps,])

#fir - alces
fir_mod_dat<-data.frame(fir_dNNdt=fir_dNNdt, fir=fir_lagged$laggedx, alces=alces_lagged$laggedx)
mod_comp_fir<-lm(fir_dNNdt~fir+alces, data=fir_mod_dat)

# model summaries
summary(mod_comp_canis)
summary(mod_comp_alces)
summary(mod_comp_alces2)
summary(mod_comp_fir)

# extract parameters
# note - linear regressions give us dynamics in the form:
# dni/nidt ~ (Intercept) + (n1_slope) * n1 + (n2_slope) n2
# and thus:
# dni/dt = n1*((Intercept) + (n1_slope) * n1 + (n2_slope) n2)
 
# growth rates
r1  <- unname(coef(mod_comp_canis)["(Intercept)"])
r2 <- unname(coef(mod_comp_alces)["(Intercept)"])
r3  <- unname(coef(mod_comp_fir)["(Intercept)"])

# self-limitation
a11 <- unname(coef(mod_comp_canis)["canis"])
a22 <- unname(coef(mod_comp_alces)["alces"])
a33 <- unname(coef(mod_comp_fir)["fir"])

# effect of canis on alces
a12 <- unname(coef(mod_comp_canis)["alces"])

# effect of alces on canis
a21 <- unname(coef(mod_comp_alces)["canis"])

#effect of fir on alces
a23 <- unname(coef(mod_comp_alces2)["fir"])

#effect of alces on fir
a32 <- unname(coef(mod_comp_fir)["alces"])

#effect of fir on canis
a13 <- 0
#effect of canis on fir 
a31 <- 0

# run ODE:
# make paramter vector:
parms <- c(r1, r2,r3, a11, a12, a13, a21, a22, a23, a31, a32, a33)
initialN <- c(canis_lagged$x[1],
              alces_lagged$x[1],
              fir_lagged$x[1])
out <- deSolve::ode(y=initialN, times=0:40, func=lv_interaction, parms=parms)
out_plot<-out
out_plot[,2]<-out_plot[,2]
out_plot[,3]<-out_plot[,3]/10 #scaled for better visualization
out_plot[,4]<-out_plot[,4]

par(mar=c(4,6,1,4))
matplot(out_plot[,1]+min(mixturedata$year), out_plot[,2:3], type="l",
        xlab="Year", ylab="", col=c("red", "black"), lty=c(1,3), lwd=2, ylim=c(0, 200), axes=F)
points(canis$year, canis$individuals,
       col="red", type="b")
points(alces$year, alces$individuals/10,
       col="black", type="b")
axis(1)
axis(2, at=c(0, 50, 100, 150, 200), c("0", "50-500", "100-1000", "150-1500", "200-2000"), las=2)
mtext("Individuals, Wolf-Moose", side = 2, line = 5, cex=0.95)
box()


par(new=TRUE)
plot(out_plot[,1]+min(mixturedata$year), out_plot[,4], type="l", col="blue", lty=2, lwd=2, axes=F, xlab="", ylab="", ylim=c(0, 1))
points(fir$year, fir$width,
       col="blue", type="b")

axis(4)
mtext("Fir Ring Width, mm", side = 4, line = 2.2, cex=0.95)
legend("topleft", legend = c("Canis lupus", "Alces alces", "Abies balsamea"),
       col=c("red", "black", "blue"), lwd=2, lty=c(1,3,2), ncol=3, bty="n", x.intersp = 0.1, cex=0.8)


# Now try with optimizer
parms <- c(r1, r2, r3, a11, a12, a13, a21, a22, a23, a31, a32, a33)

opt_data<-data.frame(time=canis$year-min(canis$year), canis=canis$individuals,
                     alces=alces$individuals, fir=fir$width)
parms[8]<-0 # assume no self-limitation for moose
parm_signs<-sign(parms)

pars<-c(log(initialN), log(abs(parms[parms!=0])))

# run optimizer
optout<-optim(par = pars, fn = lv_optim, hessian = TRUE,
            opt_data=opt_data, parm_signs=parm_signs, method="L-BFGS-B")

# extract parameter vector:
parms<-numeric(length(parm_signs))
parms[parm_signs!=0] <- exp(optout$par[-c(1:length(initialN))])*parm_signs[parm_signs!=0]
initialN <- exp(optout$par[1:length(initialN)])

out <- deSolve::ode(y=initialN, times=seq(0, 35, length=100), func=lv_interaction, parms=parms)
out_plot<-out
out_plot[,2]<-out_plot[,2]
out_plot[,3]<-out_plot[,3]/10
out_plot[,4]<-out_plot[,4]

par(mar=c(4,6,1,4))
matplot(out_plot[,1]+min(mixturedata$year), out_plot[,2:3], type="l",
        xlab="Year", ylab="", col=c("red", "black"), lty=c(1,3), lwd=2, ylim=c(0, 200), axes=F)
points(canis$year, canis$individuals,
       col="red", type="b")
points(alces$year, alces$individuals/10,
       col="black", type="b")
axis(1)
axis(2, at=c(0, 50, 100, 150, 200), c("0", "50-500", "100-1000", "150-1500", "200-2000"), las=2)
mtext("Individuals, Wolf-Moose", side = 2, line = 5, cex=0.95)
box()

par(new=TRUE)
plot(out_plot[,1]+min(mixturedata$year), out_plot[,4], type="l", col="blue", lty=2, lwd=2, axes=F, xlab="", ylab="", ylim=c(0, 1))
points(fir$year, fir$width,
       col="blue", type="b")
axis(4)
mtext("Fir Ring Width, mm", side = 4, line = 2.2, cex=0.95)

#parameter estimates
fisher_info<-solve(-optout$hessian)
optout$par_sd<-sqrt(abs(diag(fisher_info)))
parm_signs_sp<-c(rep(1, ncol(opt_data)-1), parm_signs)
parameter_intervals<-data.frame(lower_sd=numeric(length(parm_signs_sp)),
                                mu=numeric(length(parm_signs_sp)),
                                upper_sd=numeric(length(parm_signs_sp)))
parameter_intervals[parm_signs_sp!=0,]<-data.frame(lower_sd=exp(optout$par-optout$par_sd)*parm_signs_sp[parm_signs_sp!=0],
                               mu=exp(optout$par)*parm_signs_sp[parm_signs_sp!=0],
                               upper_sd=exp(optout$par+optout$par_sd)*parm_signs_sp[parm_signs_sp!=0])
row.names(parameter_intervals)<-c("N10", "N20", "N30", "r1", "r2", "r3", "a11", "a12", "a13", "a21", "a22", "a23", "a31", "a32", "a33")
parameter_intervals

A<-matrix(nrow=3, parameter_intervals$mu[-c(1:6)])
row.names(A)<-colnames(A)<-c("canis", "alces", "abies")
A
