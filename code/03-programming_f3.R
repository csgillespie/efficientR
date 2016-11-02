source("code/initialise.R")
data(movies, package="ggplot2movies")
ratings = movies[, 7:16]
popular = apply(ratings, 1, nnet::which.is.max)
tab = table(popular)
tab = tab/sum(tab)
plot(tab)

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(tab, xlab="Movie rating", ylab="Proportion of votes",  axes=FALSE, frame=FALSE, 
     lwd=6, col="steelblue", xlim=c(0.75, 10.25), ylim=c(0, 0.25), 
     panel.first = abline(h=seq(0, 0.25, 0.05), lty=3, col="grey80"))

axis(2, tick=FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(1, 1:10, 1:10, tick=F,  col.axis="grey50", cex.axis = 0.8)
title("Voting preference", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")


