mar <- c(4, 4, 1, 1)

limit <- 1.5
ylim <- 6
x <- seq(0, 4, 0.01)
y <- x * sin(2*pi*(x+1/4))
width <- 5
height <- 5
len <- length(x)

pdf("../images/generated/tube.pdf", width = width, height = height)
par(mar = mar)
plot(x, y, pch = ".", ylim = c(-ylim, ylim), xlab = "Time", ylab = "Signal")
lines(x, y + 2, lty=3)
lines(x, y - 2, lty=3)
polygon(c(x, rev(x)), c(y + 2, rev(y - 2)), col="gray", border=NA)
lines(x, y, col="red")
d1 <- 1 + 0.5 * sin(2*pi*(5*x))
lines(x, y + d1)
dev.off()
