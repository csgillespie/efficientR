source("code/initialise.R")
load("data/clock_speed.RData")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", ylim=c(0.9, 10000), xlim=c(1980, 2011), axes=FALSE, frame=FALSE, 
     xlab="", ylab="Clock speed (GHz)", 
     log="y")
abline(h=10^(-1:4), lty=3, col="grey80")
abline(h=3600, lty=2, col="grey20")

axis(1, tick = FALSE)
axis(2,10^c(0:4), c(expression(10^0), expression(10^1), expression(10^2), expression(10^3), 
                   expression(10^4)),tick = FALSE)
points(clock_speed$Year, clock_speed$MIPS, pch=21, bg=get_col(3, 240), 
       col="grey90", cex=0.9)

text(1980, 5000, "3.4 GHz", col="grey20", font.main=2, cex=1, pos=4)

title("CPU Clock Speed", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

# 
# 
# 
# library("ggplot2")
# #data("clock_speed", package="efficient")
# ggplot(clock_speed, aes(Year, MIPS)) + 
#   geom_hline(yintercept=3400, lwd=0.5, alpha=0.8) + 
#   geom_text(x=1980, y=3600, label="3.4 Ghz")+
#   geom_point(alpha=0.5, size=1) +
#   scale_y_continuous(limits=c(0.1, 10000), trans="log10") + 
#   theme_bw() + ylab("CPU clock speed (GHz)")
