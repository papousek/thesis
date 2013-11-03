mar <- c(4, 4, 1, 1)

x <- seq(0, 1/2, 0.05)
y <- 8 * sin(2*pi*x)
len <- length(x)
width <- 5
height <- 4
paper <- "special"

pdf("../images/generated/piecewise-constant-a.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, xlab = "Time", pch=19, ylab = "Signal")
dev.off()


pdf("../images/generated/piecewise-constant-b.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, pch = ".", xlab = "Time", ylab = "Signal")
for (i in 1:len) {
	points(x[i], y[i], pc = 19)
	points(x[i + 1], y[i], pc = 1)
	lines(c(x[i], x[i+1]), c(y[i], y[i]))
}
dev.off()


