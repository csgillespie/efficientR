source("code/initialise.R")

shade_under_curve <- function(fun, xmin, xmax, length=100, 
                              col="grey"){
  xvals <- seq(xmin, xmax, length=length)
  dvals <- match.fun(fun)(xvals)
  polygon(c(xvals,rev(xvals)),c(rep(0,length),rev(dvals)),col=col, border=NA)
}


col=function(alpha=255) rgb(85,130,169, alpha=alpha, maxColorValue=255)
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0, type="n", xlim=c(0, 1), ylim=c(0, 1), axes=FALSE, frame=FALSE, xlab="", ylab="")

shade_under_curve(function(x) x^2, 0, 1, col="grey95")
abline(h=seq(0, 1, 0.2), lty=1, col="grey90")
curve(x^2, 0,1, add=TRUE, lwd=4, col=col())
axis(1, tick=F,  col.axis="grey50", cex.axis = 0.8)
axis(2, tick=F,  col.axis="grey50", cex.axis = 0.8)

text(0.77, 0.7, "f(x)", col=col(), font=2, cex=1.2)
text(0, 0.97, "Miss", pos=4, font=1, cex=1)
text(1, 0.03, "Hit", pos=2, font=1, cex=1)


title("Monte Carlo integration", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

set.seed(5)
N = 40
px = runif(N); py=runif(N)
points(px[py < px^2], py[py < px^2], pch=21, bg=col(255), col="grey10")
points(px[py > px^2], py[py > px^2], pch=21, bg=col(100), col="grey80")
