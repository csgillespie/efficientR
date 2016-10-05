source("code/initialise.R")
# ## Original idea from https://github.com/csgillespie/efficientR/issues/121 and @adamryczkowski
# 
# n_rep=10 #Number of times to generate a test sample. This smooths the chart.
# dd = matrix(0, nrow=100, ncol=3)
# ns = 10^(seq(from=log10(10), to=log10(10^6), length.out =nrow(dd)))
# 
# tmp = matrix(0, nrow=n_rep, ncol=2)
# for (i in seq_len(nrow(dd)))
# {
#   for(j in seq_len(n_rep))
#   {
#     s = sample(c(TRUE, FALSE), ns[i], TRUE, prob=c(1-0.0001,0.0001))
#     tmp[j,] = summary(
#      microbenchmark::microbenchmark(
#         which.max(s),
#         which(s)[[1]])
#       )[['median']]
#   }
#   dd[i,] = c(ns[i], colMeans(tmp))
#   cat(".")
# }
#saveRDS(dd, file="extdata/07-which_comparison.RData")
dd = readRDS(file="extdata/07-which_comparison.RData")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(dd[,1], dd[,3]/dd[,2], log="xy",
     pch=21, xlim=c(9, 10^4), ylim=c(1, 10^2), 
     axes=FALSE, frame=FALSE, 
     ylab="Relative speed of 'which.min' compared to 'which'", xlab="Vector length",
     bg="steelblue")
abline(h=10^(0:2), lty=3, col="grey80")
abline(h=c(2, 5, 20, 50), lty=3, col="grey90")


axis(2, tick=FALSE)
axis(1, at = 10^(1:4), labels=c(expression(10^1),expression(10^2),expression(10^3),expression(10^4)), tick=F)



