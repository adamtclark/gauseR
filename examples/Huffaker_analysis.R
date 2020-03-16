data("huffaker_1963")
head(huffaker_1963)

# sort data by species
exp_3b <- huffaker_1963[huffaker_1963$Figure=="3b",] 
exp_3b <- exp_3b[exp_3b$Weeks!="1",]
exp_3b <- exp_3b[exp_3b$Weeks!="2",]
prey <- exp_3b[exp_3b$Species=="Prey (Eotetranychus sexmaculatus)",]
predator <- exp_3b[exp_3b$Species=="Predator (Typhlodromus occidentalis)", ]

#get time-lagged observations for each species
prey_lagged<-get_lag(x = prey$Individuals, time = prey$Weeks)
predator_lagged<-get_lag(x = predator$Individuals, time = predator$Weeks)

# calculate per-capita growth rates
predator_dNNdt<-percap_growth(x = predator_lagged$x, laggedx = predator_lagged$laggedx, dt = predator_lagged$dt)
prey_dNNdt<-percap_growth(x = prey_lagged$x, laggedx =prey_lagged$laggedx, dt = prey_lagged$dt)

# fit linear models to dNNdt, based on average
# abundances between current and lagged time steps

# Predator prey
predator_mod_dat<-data.frame(predator_dNNdt=predator_dNNdt, predator=predator_lagged$laggedx, prey=prey_lagged$laggedx)
mod_comp_predator<-lm(predator_dNNdt~prey+predator, data=predator_mod_dat)

#prey - predator
prey_mod_dat<-data.frame(prey_dNNdt=prey_dNNdt, prey=prey_lagged$laggedx, predator=predator_lagged$laggedx, 
                          predator=predator_lagged$laggedx)
mod_comp_prey<-lm(prey_dNNdt~predator, data=prey_mod_dat)

# model summaries
summary(mod_comp_predator)
summary(mod_comp_prey)

# extract parameters
# note - linear regressions give us dynamics in the form:
# dni/nidt ~ (Intercept) + (n1_slope) * n1 + (n2_slope) n2
# and thus:
# dni/dt = n1*((Intercept) + (n1_slope) * n1 + (n2_slope) n2)
 
# growth rates
r2<-unname(coef(mod_comp_predator)["(Intercept)"])
r1<-unname(coef(mod_comp_prey)["(Intercept)"])


# self-limitation
a22 <- unname(coef(mod_comp_predator)["predator"])
a11 <- 0

# effect of prey on the predator
a21 <- unname(coef(mod_comp_predator)["prey"])

# effect of predator on the prey
a12 <- unname(coef(mod_comp_prey)["predator"])


# run ODE:
# make paramter vector:
parms <- c(r1, r2, 0, a12, a21, 0)
initialN <- c(prey_lagged$x[1], predator_lagged$x[1])

out <- deSolve::ode(y=initialN, times=0:60, func=lv_interaction, parms=parms, method="ode45")
out_plot<-out

par(mar=c(4,4,1,1))
matplot(out_plot[,1]+min(exp_3b$Weeks), out_plot[,2:3], type="l",
        xlab="Week", ylab="", col=c("black", "red"), lty=c(1,3), lwd=2)
points(predator$Weeks, predator$Individuals,
       col="red", type="b")
points(prey$Weeks, prey$Individuals,
       col="black", type="b")

# Now try with optimizer
parms <- c(r1, r2, 0, a12, a21, 0)
opt_data<-data.frame(time=predator$Weeks-min(predator$Weeks),
                     prey=prey$Individuals, predator=predator$Individuals)

# run optimizer
parm_signs<-sign(parms)
pars<-c(log(initialN), log(abs(parms[parms!=0])))
optout<-optim(par = pars, fn = lv_optim, hessian = TRUE,
            opt_data=opt_data, parm_signs=parm_signs)

# extract parameter vector:
parms<-numeric(length(parm_signs))
parms[parm_signs!=0] <- exp(optout$par[-c(1:length(initialN))])*parm_signs[parm_signs!=0]
initialN <- exp(optout$par[1:length(initialN)])

out <- deSolve::ode(y=initialN, times=seq(0, 60, length=100), func=lv_interaction, parms=parms)
out_plot<-out

# Allow self-limitation by predator
parms <- c(r1, r2, 0, a12, a21, a22)
opt_data<-data.frame(time=predator$Weeks-min(predator$Weeks),
                     prey=prey$Individuals, predator=predator$Individuals)

# run optimizer
parm_signs<-sign(parms)
pars<-c(log(initialN), log(abs(parms[parms!=0])))
optout<-optim(par = pars, fn = lv_optim, hessian = TRUE,
              opt_data=opt_data, parm_signs=parm_signs)

# extract parameter vector:
parms<-numeric(length(parm_signs))
parms[parm_signs!=0] <- exp(optout$par[-c(1:length(initialN))])*parm_signs[parm_signs!=0]
initialN <- exp(optout$par[1:length(initialN)])

out <- deSolve::ode(y=initialN, times=seq(0, 60, length=100), func=lv_interaction, parms=parms)
out_plot<-out

par(mar=c(4,4,1,1))
matplot(out_plot[,1]+min(exp_3b$Weeks), out_plot[,2:3], type="l",
        xlab="Week", ylab="Individuals", col=c("black", "red"), lty=c(1,3), lwd=2, ylim=c(0,1500))
points(predator$Weeks, predator$Individuals,#/mean(canis_lagged$x,na.rm=T),
       col="red", type="b")
points(prey$Weeks, prey$Individuals,#/mean(alces_lagged$x,na.rm=T),
       col="black", type="b")
