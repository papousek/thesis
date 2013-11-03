directory <- "../data/parasim-2013-05-12/"
models <- c("lotkav-common", "lotkav-iterations", "lotkav-long-property", "lorenz84-common", "lorenz84-iterations", "lorenz84-long-property", "meyer91-common")

mar <- c(4, 4, 1, 1)
width <- 5
height <- 4
paper <- "special"

for (model in models) {

	data.summary <- read.csv(paste0(directory, model, "-summary.csv"));
	data.summary <- data.summary[order(data.summary$environment.size), ];
	data.iterations <- read.csv(paste0(directory, model, "-iterations.csv"));

	for (env in unique(data.summary$environment.name)) {		
		summary <- data.summary[data.summary$environment.name == env,];
		if (env == "dist") {
			xlab <- "Machines";
		} else {
			xlab <- "Cores";
		}
		# times
		pdf(paste0("../images/generated/", model, "-", env, "-time.pdf"), width = width, height = height)
		par(mar = mar);
		plot(summary$environment.size, summary$time, pch=18, ylab="Time (s)", log = "x", xlab=xlab, ylim=c(0, max(summary$time)), xlim=c(1, 16), xaxt = "n");
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
		pdf(paste0("../images/generated/", model, "-", env, "-cache.pdf"), width = width, height = height)
		par(mar = mar);
		plot(summary$environment.size, summary$cache.secondary.miss, pch=18, ylab="Cache miss", xlab=xlab, log = "x", xlim=c(1, 16), xaxt = "n");
		lines(summary$environment.size, summary$cache.secondary.miss);
		axis(side = 1, at = c(1, 2, 4, 8, 16))
		dev.off();

		# iterations
		iterations <- data.iterations[data.iterations$environment.name == env,]
		iterations <- iterations[iterations$environment.size == 4,]
		pdf(paste0("../images/generated/", model, "-", env,"-iterations-primary-summary.pdf"), width = width, height = height);
		par(mar = mar);
		f <- function(x) {
			((2^x + 1)^log(iterations$primary[1] + iterations$secondary[1], 3)) / 2
		}
		plot(iterations$iteration, iterations$primary, pch=18, ylab="Trajectories", xlab="Iteration", ylim = c(0, max(iterations$primary[nrow(iterations)], f(nrow(iterations)))));
		lines(iterations$iteration, iterations$primary);
		curve(f, from = 1, to = nrow(iterations), col="red", add=TRUE, lty=2)
		dev.off();
	}

	file.balancer <- paste0(directory, model, "-dist-16-balancer.csv")
	if (file.exists(file.balancer)) {
		data.balancer <- read.csv(file.balancer);
		pdf(paste0("../images/generated/", model,"-balancer.pdf"), width = width, height = height);
		par(mar = mar);
		balancer <- apply(data.balancer, 1, function(x) {sum((x != 0) + 0)})
		plot(balancer, pch=18, xlab="Balancer Ticks", ylab="Machine Usage")
		lines(balancer)
		dev.off();
	}
}
