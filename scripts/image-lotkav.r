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
time <- seq(0, 100, by = 0.05)
 
outDense <- as.data.frame(ode(func = lotkav, y = state, parms = pars, times = time))
out <- outDense[seq(1, 2000, 100),]


png("../images/lotkav-timeserie.png", bg = "transparent", width=300, height=300)
matplot(out[,-1], type = "o", pch=c(23, 17), col = c("blue", "red"), xlab = "Čas", ylab = "Populace")
legend("topright", c("Kořist", "Predátor"), lty = c(1,2), col = c("blue", "red"), pch=c(23, 17))
#title("Vývoj systému Predátor a kořist v čase")
dev.off()

png("../images/lotkav-oscil.png", bg = "transparent", width=300, height=300)
plot(outDense$x, outDense$y, pch = "o", xlab = "Kořist", ylab = "Predátor")
#title("Oscilace systému Predátor a kořist")
dev.off()
