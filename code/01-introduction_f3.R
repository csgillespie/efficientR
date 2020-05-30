if(!file.exists("extdata/out-ice.Rds")) {
  library("rnoaa")
  library("ggplot2")
  yrs = seq(1985, 2019, by = 10)
  out = sapply(yrs, function(x)
    sea_ice(year = x, mo = 'Sep', pole = 'N'))
  names(out) = yrs
  dir.create("extdata")
  saveRDS(out, "extdata/out-ice.Rds")
} else {
  out = readRDS("extdata/out-ice.Rds")
}
df = dplyr::rbind_all(out, id = "Year")
xlims = quantile(df$lat, probs = c(0.01, 0.90))
ylims = quantile(df$long, probs = c(0.01, 0.99))
ggplot(df, aes(long, lat, group = paste(group, Year))) +
  geom_path() +
  geom_polygon(aes(fill = Year), alpha = 0.3) +
  xlim(xlims) +
  ylim(ylims) +
  scale_fill_brewer(type = "seq") +
  theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text = element_blank())
ggsave("figures/icesheet-change.png")
