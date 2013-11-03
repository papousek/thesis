mar <- c(4, 4, 1, 1)

limit <- 1.5
ylim <- 5
x <- seq(0, 4, 0.01)
y <- x * sin(4*pi*(x+1/4))
width <- 5
height <- 4


pdf("../images/generated/stl-example-geq-limit.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
lines(x, y, lty = 3)
lines(x, ifelse(y >= limit, 1, 0), col = "red")
abline(h = limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries", "formula"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

pdf("../images/generated/stl-example-leq-limit.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
lines(x, y, lty = 3)
lines(x, ifelse(y <= -limit, 1, 0), col = "red")
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries", "formula"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

pdf("../images/generated/stl-example-geq-limit-future-leq-limit.pdf", width = width, height = height)
par(mar = mar)
formula <- ifelse(y <= -limit, 1, 0)
len <- length(formula)
for (i in 1:len) {
	if (i + 50 > len) {
		break
	}
	formula[i] <- 0
	for (j in 1:50) {
		if ((y > limit)[i] && formula[i+j] == 1) {
			formula[i] <- 1
			break
		}
	}
}

plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
lines(x, y, lty = 3)
lines(x[1:(len-50)], formula[1:(len-50)], col = "red")
abline(h = limit, col="blue", lty=2)
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries", "formula"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

pdf("../images/generated/stl-example-future-geq-limit-future-leq-limit.pdf", width = width, height = height)
par(mar = mar)
len <- length(formula)
for (i in 1:len) {
	if (i + 100 > len) {
		break
	}
	for (j in 1:50) {
		if (formula[i+j] == 1) {
			formula[i] <- 1
			break
		} else {
			formula[i] <- 0
		}
	}
}


plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
lines(x, y, lty = 3)
lines(x[1:(len-100)], formula[1:(len-100)], col = "red")
abline(h = limit, col="blue", lty=2)
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries", "formula"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()
