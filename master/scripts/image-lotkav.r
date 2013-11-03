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


pdf("../images/generated/lotkav-timeserie.pdf", width=width, height=height)
par(mar = mar)
matplot(out[,-1], type = "l", col = c("blue", "red"), xlab = "Cas", ylab = "Hodnota", ylim=c(0, 35), xaxt="n")
axis(side = 1, labels = c("0", "20", "40", "60", "80", "100"), at = c(0, 200, 400, 600, 800, 1000))
legend("topright", c(expression(Y[1]), expression(Y[2])), lty = c(1,2), col = c("blue", "red"))
dev.off()

pdf("../images/generated/lotkav-oscil.pdf", width=width, height=height)
par(mar = mar)
plot(out$x, out$y, pch = "o", xlab = "Prey", ylab = "Predator", ylim=c(0, 35))
dev.off()

source("./parasim.r")
pdf("../images/generated/lotkav-analysis.pdf", width=width, height=height)
par(mar = mar)
parasim.plot.csv("../data/lotkav.csv", "prey", "predator", xlab=expression(paste(Y[1], "(0)")), ylab=expression(paste(Y[2], "(0)")), cex=0.2, use.3d=F)
dev.off()

for (i in 1:7) {
	pdf(paste0("../images/generated/lotkav-analysis", i, ".pdf"), width=width, height=height)
	par(mar = mar)
	parasim.plot.csv(paste0("../data/lotkav-iteration-", i, ".csv"), "prey", "predator", xlab=expression(paste(Y[1], "(0)")), ylab=expression(paste(Y[2], "(0)")), cex=0.35, use.3d=F)
	dev.off()
}
