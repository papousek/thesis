directory <- "../data/parasim-2013-05-06/"
models <- c("lotkav-common", "lotkav-iterations", "lotkav-long-property", "lorenz84-common", "lorenz84-iterations", "lorenz84-long-property", "meyer91-common")

mar <- c(4, 4, 1, 1)
width <- 5
height <- 4
paper <- "special"

par(mar = mar);

for (model in models) {

	summary <- read.csv(paste0(directory, model, "-summary.csv"));
	summary <- summary[order(summary$environment.size), ];
	iterations <- read.csv(paste0(directory, model, "-iterations.csv"));
	iterations <- iterations[iterations$environment.size == 16, ]

	# times
	pdf(paste0("../images/generated/", model, "-time.pdf"), width = width, height = height)
	plot(summary$environment.size, summary$time, pch=18, ylab="Time (s)", log = "x", xlab="Machines", ylim=c(0, max(summary$time)), xlim=c(1, 16), xaxt = "n");
	lines(summary$environment.size, summary$time);
	size_min <- min(summary$environment.size);
	size_max <- max(summary$environment.size);
	time_max <- max(summary$time);
	f <- function(x) {
		y = (time_max / x) * size_min
	}
	curve(f, from = size_min, to = size_max, col="red", add=TRUE, lty=2)
	axis(side = 1, at = c(1, 2, 4, 8, 16))
	dev.off();

	# cache
	pdf(paste0("../images/generated/", model, "-cache.pdf"), width = width, height = height)
	plot(summary$environment.size, summary$cache.secondary.miss, pch=18, ylab="Cache miss", xlab="Machines", log = "x", xlim=c(1, 16), xaxt = "n");
	lines(summary$environment.size, summary$cache.secondary.miss);
	axis(side = 1, at = c(1, 2, 4, 8, 16))
	dev.off();

	# iterations
	pdf(paste0("../images/generated/", model, "-iterations-primary.pdf"), width = width, height = height)
	plot(iterations$iteration, iterations$primary, pch=18, ylab="Trajectories", xlab="Iteration");
	lines(iterations$iteration, iterations$primary);
	dev.off();
	pdf(paste0("../images/generated/", model, "-iterations-secondary.pdf"), width = width, height = height)
	plot(iterations$iteration, iterations$secondary, pch=18, ylab="Trajectories", xlab="Iteration");
	lines(iterations$iteration, iterations$secondary);
	dev.off();
}
