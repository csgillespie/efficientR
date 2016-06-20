library(stringi)
library(dplyr)

f = list.files(pattern = "Rmd")

i = 1

doc_stats = data_frame(
  Chapter = rep(NA, length(f)),
  Words = rep(NA, length(f)))

for(i in 1:length(f)){
  doc_stats$Chapter[i] = f[i]
  d = readLines(f[i])
  s = stri_stats_latex(d)
  doc_stats$Words[i] = s["Words"]
}
