mar <- c(4, 4, 1, 1)

limit <- 1.5
ylim <- 5
x <- seq(0, 4, 0.01)
y <- x * sin(4*pi*(x+1/4))
width <- 450
height <- 450
bg <- "white"

png("../images/stl-example-geq-limit.png", bg = bg, width=width, height=height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Čas", ylab = "Hodnota signálu")
lines(x, y, lty = 3)
lines(x, ifelse(y >= limit, 1, 0), col = "red")
abline(h = limit, col="blue", lty=2)
legend("topleft", c("signál", "ohraničení", "pravdivost formule"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

png("../images/stl-example-leq-limit.png", bg = bg, width=width, height=height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Čas", ylab = "Hodnota signálu")
lines(x, y, lty = 3)
lines(x, ifelse(y <= -limit, 1, 0), col = "red")
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signál", "ohraničení", "pravdivost formule"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

png("../images/stl-example-geq-limit-future-leq-limit.png", bg = bg, width=width, height=height)
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

plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Čas", ylab = "Hodnota signálu")
lines(x, y, lty = 3)
lines(x[1:(len-50)], formula[1:(len-50)], col = "red")
abline(h = limit, col="blue", lty=2)
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signál", "ohraničení", "pravdivost formule"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()

png("../images/stl-example-future-geq-limit-future-leq-limit.png", bg = bg, width=width, height=height)
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


plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Čas", ylab = "Hodnota signálu")
lines(x, y, lty = 3)
lines(x[1:(len-100)], formula[1:(len-100)], col = "red")
abline(h = limit, col="blue", lty=2)
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signál", "ohraničení", "pravdivost formule"), lty = c(3, 2, 1), col = c("black", "blue", "red"))
dev.off()
