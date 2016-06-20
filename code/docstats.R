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

doc_stats

# # code to rename chapters (run once)
# oldnums = 5:10
# newnums = oldnums + 1
# oldnums[nchar(oldnums) == 1] = paste0("0", oldnums[nchar(oldnums) == 1])
# newnums[nchar(newnums) == 1] = paste0("0", newnums[nchar(newnums) == 1])
# i = 1
# fnew = f
# for(i in seq_along(oldnums)){
#   j = grep(pattern = oldnums[i], f)
#   fnew[j] = gsub(pattern = oldnums[i], replacement = newnums[i], x = f[j])
#   file.rename(f[j], fnew[j])
# }
# 
# fnew

