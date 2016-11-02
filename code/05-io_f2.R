source("code/initialise.R")
library(microbenchmark)
library(dplyr)
library(ggplot2)
# Start corresponds to 0.1 MB
io_data = function(start=1,
                   end=6, length.out=10, times = 5, reps=10){
  library(feather)# avoid travis issues
  cols = 20
  #start = 1;end=2;length.out=5;times=5
  rows = 10^(seq(start,end, length.out = length.out))
  res = NULL
  i = 3
  for(i in seq_along(rows)) {
    no_of_rows = floor(rows[i])
    for(k in 1:reps) {
      m = matrix(runif(no_of_rows * 20), nrow = no_of_rows, ncol = 20)
      m = as.data.frame(m)
      fname = replicate(3, tempfile())
      
      (mb_write = microbenchmark(times = times,
                                 base = write.csv(m, file = fname[1], row.names = FALSE),
                                 feather = write_feather(m, fname[2]),
                                 rds = saveRDS(m, fname[3]), unit="s"))
      
      (mb_read = microbenchmark(times = times,
                                base = read.csv(fname[1]),
                                feather = read_feather(fname[2]),
                                rds = readRDS(fname[3]), unit="s"))
      
      
      sizes = file.size(fname)
      
      
      tab_read = tapply(mb_read$time/1000, mb_read$expr, mean)
      tab_write = tapply(mb_write$time/1000, mb_write$expr, mean)
      res_tmp = data.frame(exp = names(tab_read),
                           read_time = as.vector(tab_read),
                           write_time = as.vector(tab_write),
                           rows = no_of_rows,
                           size=sizes, rel=sizes/sizes[1])
      
      unlink(fname)
      gc()
    }
    
    res = rbind(res, res_tmp)
    message(i)
  }
  
  res
}

# resa = io_data(1, 2, 10, times=5000, reps=200)
# resb = io_data(2, 3, 10, times=1000, reps=100)
# resc = io_data(3, 4, 10, times=50, reps=100)
# resd = io_data(4, 5, 10, times=50, reps=50)
# rese = io_data(5, 6, 10, times=50, reps=50)
# res = rbind(resa, resb, resc, resd)#, rese)



#saveRDS(res, file="extdata/05-f2.RData")
res = readRDS(file="extdata/05-f2.RData")




res1 = group_by(res, rows, exp)
res2 = summarise(res1, 
                 "read_time" = mean(read_time),
                 "write_time" = mean(write_time), 
                 "no_rows" = mean(rows), 
                 "size"=mean(size), "rel"=mean(rel))


res2$MB = 20*res2$rows*18/10^6

res2$Read_Time = NA
res2$Write_Time = NA
i = 10
for(i in res2$no_rows){
  sel = res2$no_rows == i
  res2$Read_Time[sel] = res2$read_time[sel] / res2$read_time[sel][1]
  res2$Write_Time[sel] = res2$write_time[sel] / res2$write_time[sel][1]
}

dd_plotting = data.frame(MB = rep(res2$MB, 3), 
                         time = c(res2$rel, res2$Read_Time, res2$Write_Time), 
                         file_type=c("base", "feather","rds"), 
                         type=rep(c("File size", "Read time", "Write time"), each=nrow(res2)))

dd_plotting$type = factor(dd_plotting$type, levels=c("File size", "Write time", "Read time"))


g = ggplot(dd_plotting, aes(MB, time)) + 
  geom_line(aes(colour = file_type, linetype=file_type), size=1) + 
  facet_grid(~ type) +
  scale_x_continuous(limits=c(min(dd_plotting$MB),36), expand = c(0, 0), trans="log10") + 
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
  ylab("Relative to CSV") +  xlab("CSV file size (MB)") + 
  scale_colour_manual(values=c(get_col(2), get_col(3), get_col(4))) + 
  scale_y_continuous(limits=c(0,1.05), expand = c(0, 0)) 
g1 = g + theme(strip.background = element_rect(fill = "white"), 
               strip.text = element_text( hjust = 0.95, face="bold")) + 
  guides(colour = FALSE, linetype=FALSE)

g1
labels = tibble::frame_data(
  ~MB, ~time, ~file_type, ~type,
  0.01, 0.97, "base", "File size",
  0.012, 0.85, "feather", "File size",
  0.01, 0.37, "rds", "File size"
)


g2 = g1 + geom_text(data=labels, aes(color=file_type, label=file_type))
print(g2)
















