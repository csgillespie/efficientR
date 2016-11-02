source("code/initialise.R")
load("extdata/clock_speed.RData")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", ylim=c(0.9, 10000), xlim=c(1980, 2011), axes=FALSE, frame=FALSE, 
     xlab="", ylab="Clock speed (MHz)", 
     log="y")
abline(h=10^(-1:4), lty=3, col="grey80")
abline(h=3600, lty=2, col="grey20")

axis(1, tick = FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(2,10^c(0:4), c(expression(10^0), expression(10^1), expression(10^2), expression(10^3), 
                   expression(10^4)),tick = FALSE,  col.axis="grey50", cex.axis = 0.8)
points(clock_speed$Year, clock_speed$MIPS, pch=21, bg=get_col(3, 240), 
       col="grey90", cex=0.9)

text(1980, 5000, "3.4 GHz", col="grey20", font.main=2, cex=1, pos=4)

title("CPU clock speed", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")
