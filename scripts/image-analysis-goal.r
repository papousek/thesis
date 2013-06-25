library("plotrix")
mar <- c(4, 4, 1, 1)
width <- 5
height <- 4

pdf("../images/generated/analysis-goal.pdf", width=width, height=height)
par(mar = mar)
plot(0:100, 0:100, col="white", xlab="Prey", ylab="Predator")
x <- c(seq(from=0.01, to=0.99, by=0.01), 1:100)
y <- 50/x
temp <- c()
for (i in y) {
	temp <- c(temp, if (i > 100) { 100 } else { i });
}
y <- temp
polygon(c(0, 0, x, 100), c(0, 100, y, 0), col="red", border=NA)
polygon(c(100, x), c(100, y), col="green", border=NA)
draw.circle(50, 50, 10, col="red", border=NA)
dev.off()
