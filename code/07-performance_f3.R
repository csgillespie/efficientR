load("data/07-rcpp_comparison.RData")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01, cex.axis=0.9, las=1)
boxplot(z, ylab="Log (time)", axes=FALSE,  
        pars = list(boxwex = 0.2, staplewex = 0.5, outwex = 0.5), 
        cex=0.5)
grid()
