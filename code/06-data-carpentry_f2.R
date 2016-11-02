source("code/initialise.R")
res = readRDS("extdata/res-datatable.Rds")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.9, las=1, xaxs='i',yaxs='i')
plot(0.1, type="n", xlim=c(0, 400), ylim=c(0, 80), axes=FALSE, frame=FALSE, 
    cex.axis=0.9, las=1, xaxs='i',yaxs='i', 
    xlab=NA, ylab="Time (relative to the fastest)")
mtext("Size (MB)", side=1, padj=2)

abline(h=seq(0, 80, by=20), lty=1, col="grey90")


lines(res$MB[res$exp=="base_sqrbrkt"], res$Time[res$exp=="base_sqrbrkt"], 
      col=get_col(1), lwd=2)
text(400, 72, "base", col=get_col(1), pos=2)
lines(res$MB[res$exp=="dplyr_filter"], res$Time[res$exp=="dplyr_filter"], 
      col=get_col(2), lwd=2)
text(400, 45, "dplyr", col=get_col(2), pos=2)
lines(res$MB[res$exp=="dt_key"], res$Time[res$exp=="dt_key"], 
      col=get_col(3), lwd=2)
text(400, 4, "DT:Key", col=get_col(3), pos=2)
lines(res$MB[res$exp=="dt_standard"], res$Time[res$exp=="dt_standard"], 
      col=get_col(4), lwd=2)
text(400, 16, "DT", col=get_col(4), pos=2)

axis(1, seq(0, 400, 400), tick=FALSE,  col.axis="grey50", cex.axis = 0.8)
axis(2, seq(0, 80, by=20), tick=FALSE,  col.axis="grey50", cex.axis = 0.8)


title("Subsetting comparison", adj=1, 
      cex.main=0.9, font.main=2, col.main="black")
