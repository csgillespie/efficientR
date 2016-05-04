library("benchmarkme")
library(ggplot2)
# results = plot_past()
# times = sort(tapply(results$time, results$id, mean))
# times = times/min(times)
# past_results = data.frame(times, rank=1:length(times))
#save(past_results, file="data/past_results.RData")
load("data/past_results.RData")
source("code/initialise.R")
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", ylim=c(0.95, 100), xlim=c(0, 158), axes=FALSE, frame=FALSE, 
     xlab="Rank", ylab="Relative Time", 
     log="y")
points(past_results$rank, past_results$times, 
       pch=21, bg=get_col(3, 240), 
       col="grey90", cex=0.9)

## Grid lines
abline(h=c(1, 2, 5, 10, 20, 50, 100), lty=3, col="grey80")

## Axis
axis(1, tick = FALSE)
axis(2,c(1, 2,10, 20,100), c(1, 2,10, 20,100),tick = FALSE)

## Point out the slow CPU
text(130, 50, "Intel Atom @ 1.66GHz", pos=3, col="grey20", cex=0.9)

## Title
title("CPU Benchmarks", adj=1, 
      cex.main=1, font.main=2, col.main="black")



