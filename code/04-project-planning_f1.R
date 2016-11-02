source("code/initialise.R")

x = seq(0, 1, length.out=100)
dd = data.frame(Phase = rep(c("Planning", "Programming", "Write-up"), each=length(x)), 
                Time = c(dbeta(x, 2, 6), dbeta(x, 2, 2) + 0.2, dbeta(x, 6, 2)), 
                x = c(x, x, x))
dd$x = dd$x * 4


par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", ylim=c(0, 3), xlim=c(0, 4), axes=FALSE, frame=FALSE, 
     xlab=NA, ylab="Level of activity")
abline(h=0:4, lty=1, col="grey80")

lines(dd$x[dd$Phase=="Planning"], dd$Time[dd$Phase=="Planning"], 
      col=get_col(2), lwd=2)
text(1.1, 2.8, "Planning", col=get_col(2))

lines(dd$x[dd$Phase=="Programming"], dd$Time[dd$Phase=="Programming"], 
      col=get_col(3), lwd=2)
text(2, 1.8, "Programming", col=get_col(3))


lines(dd$x[dd$Phase=="Write-up"], dd$Time[dd$Phase=="Write-up"], 
      col=get_col(1), lwd=2)
text(2.9, 2.8, "Write-up", col=get_col(1))
axis(1, c(0), c("Start"), hadj=0, tick=FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(1, c(4), "End", hadj=1,  col.axis="grey50", cex.axis = 0.8)

title("Key project phases", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")
mtext("Time", side=1, padj=2)

