library(openxlsx)

file_list = list.files( pattern="*.xls")
for(i in 1:length(file_list)){ 
  if(i == 1){
    a <- NA
  }
  print(file_list[i])
  temp <- read.delim(file = file_list[i],sep = "\t",stringsAsFactors = F)
  demo <- rbind(a, temp)
  a <- demo
  
}
a <- a[-1,]
write.xlsx(x = a, file = "output_file.xlsx", asTable = T)
