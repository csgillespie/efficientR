# dd = NULL
# for(i in seq(2, 4, length.out=12)) {
#   x = rnorm(10^i)
#   dd_tmp = rbenchmark::benchmark(my_mean(x), cmp_mean(x), mean(x), 
#                                  columns=c("test", "elapsed", "relative"),
#                                  order="relative", replications=5000)
#   dd_tmp$i = i
#   dd = rbind(dd, dd_tmp)
# }
# dd$p = 10^dd$i
# dir.create("data", showWarnings = FALSE)
# mean_comparison = dd
# save(mean_comparison, file="extdata/mean_comparison.RData")




source("code/initialise.R")
load(file="extdata/mean_comparison.RData")

dd = mean_comparison
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0, type="n", ylim=c(0, 200), xlim=c(10^2, 10^4), axes=FALSE, frame=FALSE, 
     xlab="Sample size", ylab="Relative timings", 
     log="x")
abline(h=seq(0, 200, 50), lty=1, col="grey90")

m1 = dd[dd$test=="mean(x)",]
lines(m1$p, m1$relative, lwd=3, col=3)
m1 = dd[dd$test=="cmp_mean(x)",]
lines(m1$p, m1$relative, col=2, lwd=3)
m1 = dd[dd$test=="my_mean(x)",]
lines(m1$p, m1$relative, col=5, lwd=3)

## Axis labels
axis(2, tick=FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(1, at = 10^(2:4), labels=c(expression(10^2), expression(10^3), expression(10^4)), 
     tick=FALSE,  col.axis="grey50", cex.axis = 0.8)

## Title
title("Compiled vs non-compiled", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

## Line labels
text(1000, 90, "Pure R", col=5, lwd=2, font=2)
text(1000, 20, "Compiled R", col=2, font=2)
text(8000, 10, "mean", col=3, font=2)
