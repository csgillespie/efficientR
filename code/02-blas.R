source("code/initialise.R")
library("ggplot2")
res_blas = readRDS("extdata/res_rl_blas.Rds")
res_noblas = readRDS("extdata/res_rl_noblas.Rds")
res_blas$blas = "Optimized"
res_noblas$blas = "Standard"
res_all = rbind(res_blas, res_noblas)
res_all$test_group = factor(res_all$test_group)
levels(res_all$test_group) = c("Programming", "Matrix calculation", "Matrix function")

g = ggplot(res_all) + geom_violin(aes(test_group, elapsed, fill = blas),position=position_dodge(0.9))


g1 = g + labs(title = "Performance gains with BLAS", 
          x = "Benchmark", y = "Elapsed time",colour = NULL, fill = NULL) + 
  theme(panel.grid.major.y = element_line(colour = "gray90"), 
    panel.grid.minor = element_line(colour = NA), 
    panel.grid.major.x = element_line(colour = NA), 
    plot.title = element_text(size = 12, 
        face = "bold", hjust = 1, vjust = 0), 
    panel.background = element_rect(fill = NA), 
    legend.background = element_rect(fill = NA), 
    legend.position = c(0.93, 0.92), 
    axis.ticks.x = element_line(linetype = "blank")) + 
  scale_fill_manual(values=c(get_col(2), get_col(9)))

g1 = g1 + scale_y_continuous(limits=c(0,12), expand = c(0, 0))
print(g1)
