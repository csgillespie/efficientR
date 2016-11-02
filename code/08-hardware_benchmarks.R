library("benchmarkme")
library(ggplot2)
# results = plot_past()
# times = sort(tapply(results$time, results$id, mean))
# times = times/min(times)
# past_results = data.frame(times, rank=1:length(times))
#save(past_results, file="extdata/past_results.RData")
load("extdata/past_results.RData")
source("code/initialise.R")
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", ylim=c(0.95, 100), xlim=c(0, 158), axes=FALSE, frame=FALSE, 
     xlab="Rank", ylab="Relative time", 
     log="y", panel.first = abline(h=c(1, 2, 5, 10, 20, 50, 100), lty=1, col="grey90"))
points(past_results$rank, past_results$times, 
       pch=21, bg=get_col(3, 240), 
       col="grey90", cex=0.9)


## Axis
axis(1, tick = FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(2,c(1, 2,5,10, 20,50, 100), c(1, 2,5,10, 20,50, 100), tick = FALSE,  col.axis="grey50", cex.axis = 0.8)

## Point out the slow CPU
text(130, 50, "Intel Atom @ 1.66GHz", pos=3, cex=0.9)

## Title
title("CPU benchmarks", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")



