library(deSolve)

lorenz <- function (time, state, pars) {
    with(as.list(c(state, pars)), {
	dx0 = a * F - (x1 * x1 + x2 * x2 + a * x0)
	dx1 = (x0 * x1 + G) - (b * x0 * x2 + x1)
	dx2 = (b * x0 * x1 + x0 * x2) - x2
        return(list(c(dx0, dx1, dx2)))
    })
}


pars <- c(a = 0.25, b = 4, F = 1.5, G = 0.2)
state <- c(x0 = 0.0, x1 = 0.0, x2 = 0.0)
time <- seq(0, 30, by = 0.01)

out <- as.data.frame(ode(func = lorenz, method="lsoda", y = state, parms = pars, times = time))
mar <- c(4, 4, 1, 1)
width <- 5
height <- 4

pdf("../images/generated/lorenz84-timeserie.pdf", width=width, height=height)
par(mar = mar)
matplot(out[,c(2,3,4)], type = "l", lty=c(3, 2, 1), col = c("red", "black", "blue"), xlab = "Time", ylab = "Value", xaxt="n")
axis(side = 1, labels = c("0", "10", "20", "30", "40", "50"), at = c(0, 1000, 2000, 3000, 4000, 5000))
legend("topright", c(expression("x"["0"]), expression("x"["1"]), expression("x"["2"])), lty =c(3, 2, 1), col = c("red", "black", "blue"))
dev.off();

source("./parasim.r")
pdf("../images/generated/lorenz84-analysis.pdf", width=width, height=height)
par(mar = mar)
parasim.plot.csv("../data/lorenz84.csv", "F", "G", xlab="F", ylab="G", cex=0.2, use.3d=F)
dev.off()
