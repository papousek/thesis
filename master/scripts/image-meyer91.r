library(deSolve)

meyer <- function (time, state, pars) {
    with(as.list(c(state, pars)), {
		dCaI = (1.0 - g) * ((20.0 * (IP3 * 0.5) ^ 4.0) / ((IP3 * 0.5 + k1) ^ 4.0) + L) * CaS - (40.0 * (CaI * L) ^ D) / ((CaI * L) ^ D + k2 ^ D)
		dIP3 = C * (1.0 - (1.0 / (CaI * L + 1.0)) * (1.0 / (1.0 + R))) - D * IP3 * 0.5
		dCaS = (40.0 * (CaI * L) ^ D) / ((CaI * L) ^ D + k2 ^ D) - (1.0 - g) * ((20.0 * (IP3 * 0.5) ^ 4.0) / ((IP3 * 0.5 + k1) ^ 4.0) + L) * CaS
		dg = 1.0 * (CaI * L) ^ 4.0 * (1.0 - g) - F
        return(list(c(dCaI, dIP3, dCaS, dg)))
    })
}


pars <- c(A = 20, B = 40, C = 1.1, D = 2, E = 1, F = 0.02, k1 = 0.5, k2 = 0.15, k3 = 1, L = 0.01, R = 0.09)
state <- c(CaI = 0.1, IP3 = 0.05, CaS = 1100, g = 0)
time <- seq(0, 150, by = 0.1)

out <- as.data.frame(ode(func = meyer, y = state, parms = pars, times = time))
mar <- c(4, 4, 1, 1)
width <- 5
height <- 4

pdf("../images/generated/meyer91-timeserie.pdf", width=width, height=height)
par(mar = mar)
matplot(out[,c(2,3,4)], type = "l", col = c("red", "black", "blue"), xlab = "Time", ylab = "Concentration", log="y", xaxt="n")
axis(side = 1, labels = c("0", "50", "100", "150"), at = c(0, 500, 1000, 1500))
legend("topright", c("CaI", "IP3", "CaS"), lty = c(1,2, 3), col = c("red", "black", "blue"))
dev.off();

source("./parasim.r")
pdf("../images/generated/meyer91-analysis.pdf", width=width, height=height)
par(mar = mar)
parasim.plot.csv("../data/meyer91.csv", "C", "D", xlab="C", ylab="D", cex=0.5, use.3d=F)
dev.off()

source("./parasim.r")
pdf("../images/generated/meyer91-analysis-wrong-density.pdf", width=width, height=height)
par(mar = mar)
parasim.plot.csv("../data/meyer91-wrong-density.csv", "k1", "k2", xlab=expression("k"["1"]), ylab=expression("k"["2"]), cex=0.5, use.3d=F)
dev.off()
