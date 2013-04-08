mar <- c(4, 4, 1, 1)

limit <- 1.5
ylim <- 5
x <- seq(0, 4, 0.01)
y <- x * sin(4*pi*(x+1/4))
width <- 5
height <- 4
len <- length(x)

pdf("../images/robustness-example-leq-limit.pdf", width = width, height = height)
limitrob <- -limit - y
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries"), lty = c(3, 2), col = c("black", "blue"))
segments(x, rep(0, len), x, limitrob, col=ifelse(limitrob > 0, "green", "red"))
lines(x, y, lty = 3)
dev.off()

futurerob <- c()

for (i in 1:(len-50)) {
	futurerob <- c(futurerob, max(limitrob[i:(i+50)]))
}

pdf("../images/robustness-example-future.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
abline(h = -limit, col="blue", lty=2)
legend("topleft", c("signal", "boundaries"), lty = c(3, 2), col = c("black", "blue"))
segments(x[1:(len-50)], rep(0, len-50), x[1:(len-50)], futurerob, col=ifelse(futurerob > 0, "green", "red"))
lines(x, y, lty = 3)
dev.off()
