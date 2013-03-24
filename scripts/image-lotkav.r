# http://www.r-bloggers.com/lotka-volterra-model%C2%A0%C2%A0intro/
# and modified

library(deSolve)

lotkav <- function (time, state, pars) {
    with(as.list(c(state, pars)), {
        dx = x*(alpha - beta*y)
        dy = -y*(gamma - delta*x)
        return(list(c(dx, dy)))
    })
}
 
pars <- c(alpha = 2, beta = .5, gamma = .2, delta = .6)
state <- c(x = 10, y = 10)
time <- seq(0, 100, by = 0.1)
width <- 5
height <- 4

 
out <- as.data.frame(ode(func = lotkav, y = state, parms = pars, times = time))
mar <- c(4, 4, 1, 1)


pdf("../images/lotkav-timeserie.pdf", width=width, height=height)
par(mar = mar)
matplot(out[,-1], type = "l", col = c("blue", "red"), xlab = "Time", ylab = "Population", ylim=c(0, 35))
legend("topright", c("Prey", "Predator"), lty = c(1,2), col = c("blue", "red"))
#title("Vývoj systému Predátor a kořist v čase")
dev.off()

pdf("../images/lotkav-oscil.pdf", width=width, height=height)
par(mar = mar)
plot(out$x, out$y, pch = "o", xlab = "Prey", ylab = "Predator", ylim=c(0, 35))
#title("Oscilace systému Predátor a kořist")
dev.off()
