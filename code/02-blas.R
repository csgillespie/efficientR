source("code/initialise.R")
library("ggplot2")
res_blas = readRDS("data/res_rl_blas.Rds")
res_noblas = readRDS("data/res_rl_noblas.Rds")
res_blas$blas = "BLAS"
res_noblas$blas = "No BLAS"
res_all = rbind(res_blas, res_noblas)

head(res_all)
res_all$blas[res_all$blas == "BLAS"] = "Optimised"
res_all$blas[res_all$blas == "No BLAS"] = "Standard"

g = ggplot(res_all) + geom_violin(aes(test_group, elapsed, fill = blas)) 

g1 = g + labs(title = "Performance gains with BLAS", 
          x = "Benchmark", y = "Elapsed Time") + 
  theme(panel.grid.major = element_line(colour = "gray90"), 
    panel.grid.minor = element_line(colour = NA), 
    plot.title = element_text(size = 12, 
        face = "bold", hjust = 1, vjust = 0), 
    panel.background = element_rect(fill = NA), 
    legend.background = element_rect(fill = NA), 
    legend.position = c(0.95, 0.9)) +labs(colour = NULL, fill = NULL) + 
  scale_fill_manual(values=c(get_col(2), get_col(3)))
print(g1)
