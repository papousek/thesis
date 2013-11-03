mar <- c(4, 4, 1, 1)

limit <- 1.5
x <- seq(0, 4, 0.01)
y1 <- sin(x * pi)
y2 <- sin(x * pi + (pi))
width <- 5
height <- 4

pdf("../images/generated/phase-shift.pdf", width = width, height = height)
par(mar = mar)
plot(x, y1, pch = ".", xlab = "Time", ylab = "Signal", col="red")
lines(x, y1, col="red", lty=1);
lines(x, y2, col="blue", lty=2);
lines(c(1/2, 1/2), c(-1, 1), lwd=5);
dev.off()
