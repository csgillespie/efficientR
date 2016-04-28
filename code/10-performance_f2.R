source("code/initialise.R")

# # Code to download logs of various packages
# # Not run to avoid cranlogs dependency for book
# dd = cranlogs::cran_downloads(packages = c("V8", "Rcpp", "rPython", "rJava"),
#                               from = "2013-01-01", to = "2016-04-01")
# dd$Downloads <- ave(
#   dd$count,
#   dd$package,
#   FUN = function(x)
#     zoo::rollmean(x, k = 30, na.pad = T)
# )
# saveRDS(dd, "data/cranlog.Rds")

dd = readRDS("data/cranlog.Rds")

dd = dd[dd$count > 0, ]

v8 = dd[dd$package=="V8",]
rcpp = dd[dd$package=="Rcpp",]
rjava = dd[dd$package=="rJava",]
rpython = dd[dd$package=="rPython",]

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')

start = as.Date("2013-01-01"); end = as.Date("2016-01-01")
plot(rcpp$date[1], type="n", xlim=c(start, end), ylim=c(10^0, 10^4), 
     axes=FALSE, frame=FALSE, 
     xlab="Time", ylab="Downloads per day", 
     log="y")
abline(h=10^(0:4), lty=3, col="grey80")

abline(v=as.Date("2013-04-03"), col="grey90", lty=2)
abline(v=as.Date("2014-04-03"), col="grey90", lty=2)
abline(v=as.Date("2015-04-03"), col="grey90", lty=2)

text(as.Date("2013-04-03"), 7000, "R 3.0", pos=4, col="grey50")
text(as.Date("2014-04-03"), 7000, "R 3.1", pos=4, col="grey50")
text(as.Date("2015-04-03"), 7000, "R 3.2", pos=4, col="grey50")

lines(rcpp$date, rcpp$Downloads,  lwd=2,col=3)
lines(v8$date, v8$Downloads, lwd=2, col=4)
lines(rjava$date, rjava$Downloads, lwd=2, col=2)
lines(rpython$date, rpython$Downloads, lwd=2, col=1)

axis(2, tick=FALSE)
axis(1, at = c(start, end), labels=c(2013, 2016), tick=F)


title("The rise of Rcpp", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")

text(as.Date("2013-06-01"), 6, "rPython", col=1)
text(as.Date("2014-02-01"), 3000, "Rcpp", col=3)
text(as.Date("2015-02-01"), 80, "V8", col=4)
text(as.Date("2015-03-01"), 1000, "rJava", col=2)
