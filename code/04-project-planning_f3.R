source("code/initialise.R")
library(ggplot2)
library(data.table)
library(readr)
library("microbenchmark")



## Start corresponds to 0.1 MB
# rows = 10^(seq(3.445,6, length.out = 50))
# cols = 2 * 10^(0:2)
# res = NULL
# for(i in seq_along(rows)) {
#   for(k in 1:40) {
#     for(j in seq_along(cols)) {
#       no_of_rows = floor(rows[i]/(10^(j-1)))
#       m = matrix(runif(no_of_rows * cols[j]), nrow = no_of_rows, ncol = cols[j])
#       fname = tempfile()
#       write.csv(m, file = fname, row.names = FALSE)
#       mb = microbenchmark(times = 10,
#                           base_default = read.csv(fname),
#                           readr_default = read_csv(fname), 
#                           fread_default = fread(fname)
#       )
#       
#       
#       tab = tapply(mb$time/1000, mb$expr, mean)
#       res_tmp = data.frame(exp = names(tab),
#                            time = as.vector(tab), rows = no_of_rows,
#                            cols = cols[j])
#       unlink(fname)
#       res = rbind(res, res_tmp)
#       save(res, file="04_tmp.RData")
#     }
#   }
#   message(i)
# }
load("data/04-f3.RData")
res = aggregate(time ~ cols+rows+ exp, mean, data=res)
res$MB = res$cols*res$rows*18/1000000 ## Approximate
res$cells = paste(res$rows, res$cols)
res$Time = NA
for(i in res$cells){
  sel = res$cells == i
  res$Time[sel] = res$time[sel] / min(res$time[sel])
}
res$type = factor(res$exp, labels=c("base", "fread","readr"))

library("ggplot2")
res$facet_cols = paste("No of columns:", res$cols)

g = ggplot(res, aes(MB, Time)) + 
  geom_line(aes(colour = type), size=1) + 
  facet_grid(~ facet_cols) +
  scale_x_continuous(limits=c(min(res$MB),30), expand = c(0, 0), trans="log10") + 
  theme(panel.grid.major.y = element_line(colour = "gray90"), 
        panel.grid.minor = element_line(colour = NA), 
        panel.grid.major.x = element_line(colour = NA), 
        plot.title = element_text(size = 12, 
                                  face = "bold", hjust = 1, vjust = 0), 
        panel.background = element_rect(fill = NA), 
        legend.background = element_rect(fill = NA), 
        legend.position = c(0.95, 0.92), 
        axis.ticks.x = element_line(linetype = "blank"),
        axis.ticks.y = element_line(linetype = "blank"),
        legend.text = element_text(size = 11), 
        legend.key = element_rect(fill = NA)) +
  ylab("Relative time") +  xlab("File size (MB)") + 
  scale_colour_manual(values=c(get_col(2), get_col(3), get_col(4))) + 
  scale_y_continuous(limits=c(0,12), expand = c(0, 0)) +labs(colour = NULL)
g1 = g + theme(strip.background = element_rect(fill = "white"), 
          strip.text = element_text( hjust = 0.95, face="bold")) + 
  guides(colour = guide_legend(override.aes = list(size=1)))
print(g1)












