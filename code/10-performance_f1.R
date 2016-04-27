source("code/initialise.R")
load(file="data/mean_comparison.RData")

dd = mean_comparison
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0, type="n", ylim=c(0, 200), xlim=c(10^2, 10^4), axes=FALSE, frame=FALSE, 
     xlab="Sample size", ylab="Relative Timings", 
     log="x")
abline(h=seq(0, 200, 50), lty=3, col="grey80")

m1 = dd[dd$test=="mean(x)",]
lines(m1$p, m1$relative, lwd=2, col=3)
m1 = dd[dd$test=="cmp_mean(x)",]
lines(m1$p, m1$relative, col=2, lwd=2)
m1 = dd[dd$test=="my_mean(x)",]
lines(m1$p, m1$relative, col=5, lwd=2)


axis(2, tick=FALSE)
axis(1, at = 10^(2:4), labels=c(expression(10^2), expression(10^3), expression(10^4)), tick=F)


title("Compiled vs Non-Compiled", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

text(1000, 90, "Pure R", col=5)
text(1000, 20, "Compiled R", col=2)
text(8000, 10, "mean", col=3)
