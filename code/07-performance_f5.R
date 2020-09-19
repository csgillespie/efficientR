source("code/initialise.R")

# Code to download logs of various packages
# # Not run to avoid cranlogs dependency for book
# dd = cranlogs::cran_downloads(packages = c("V8", "Rcpp", "rPython", "rJava"),
#                                from = "2013-01-01", to = "2020-09-01")
# dd$Downloads <- ave(
#   dd$count,
#   dd$package,
#   FUN = function(x)
#     zoo::rollmean(x, k = 30, na.pad = T)
# )
#  saveRDS(dd, "extdata/cranlog.Rds")

dd = readRDS("extdata/cranlog.Rds")
dd = dd[dd$count > 0, ]

v8 = dd[dd$package == "V8", ]
rcpp = dd[dd$package == "Rcpp", ]
rjava = dd[dd$package == "rJava", ]
rpython = dd[dd$package == "rPython", ]

par(mar = c(3,3,2,1), mgp = c(2, 0.4, 0), tck = -.01,
    cex.axis = 0.9, las = 1, xaxs = 'i',yaxs = 'i')

# Blank graph
start = as.Date("2013-01-01"); end = as.Date("2021-02-01")
plot(rcpp$date[1], type = "n", xlim = c(start, end), ylim = c(10^0, 7*10^4),
     axes = FALSE, frame.plot = FALSE,
     xlab = "Time", ylab = "Downloads per day",
     log = "y")
abline(h = 10^(0:4), lty = 1, col = "grey80")

# Add R versions
R_dates = as.Date(c("2013-04-03", "2014-04-03", "2015-04-03", "2016-04-03",
                    "2017-04-03", "2018-04-03", "2019-04-03", "2020-04-03"))
R_vers = c(paste0("R 3.", 0:6), "R 4.0")
abline(v = R_dates, col = "grey90", lty = 2)
text(R_dates, 55000, R_vers,  pos = 4, col = "grey50", cex = 0.9)

# Label lines
lines(rcpp$date, rcpp$Downloads, lwd = 3,col = 3)
lines(v8$date, v8$Downloads, lwd = 2, col = 4)
lines(rjava$date, rjava$Downloads, lwd = 2, col = 2)
lines(rpython$date, rpython$Downloads, lwd = 2, col = 1)

# Add axis
axis(2, tick = FALSE,  col.axis = "grey50", cex.axis = 0.8)
axis(1, at = c(as.Date("2013-01-01"),
               as.Date("2015-01-01"),
               as.Date("2017-01-01"),
               as.Date("2019-01-01"),
               as.Date("2021-01-01")),
     labels = c(2013, 2015, 2017, 2019, 2021), tick = FALSE,  col.axis = "grey50", cex.axis = 0.8)

title("The rise of Rcpp", adj = 1,
      cex.main = 0.9, font.main = 2, col.main = "black")

# Label lines
text(as.Date("2020-06-01"), 6, "rPython", col = 1, font = 2, cex = 0.9)
text(as.Date("2020-06-01"), 20000, "Rcpp", col = 3, font = 2, cex = 0.9)
text(as.Date("2020-06-01"), 800, "V8", col = 4, font = 2, cex = 0.9)
text(as.Date("2020-06-01"), 4500, "rJava", col = 2, font = 2, cex = 0.9)
