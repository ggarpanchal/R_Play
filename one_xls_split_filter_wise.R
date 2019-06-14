# Author :- Jigar Panchal
# Github :- ggarpanchal
# Require Packages :- dplyr ( Tidyverse ), xlsx

if (!require('xlsx')) install.packages('xlsx')
if (!require('dplyr')) install.packages('dplyr')

library('xlsx')
library('dplyr')

main <- read.xlsx("Sticker_Sheet.xlsx", header = T, sheetIndex = 1)

for ( i in unique(main$Standard)){
  
  filter_DF <- main %>%
    filter(Standard == i)
  
  for( j in unique(filter_DF$Section)) {
    
    final_DF <- filter_DF %>%
      filter(Section == j) %>% 
      select(3:4)
    
    filename_xlsx <- paste(i, "_",j,".csv",sep = "")
    
    write.csv(file = filename_xlsx, x = final_DF, row.names = F, col.names = T, sep = ",", quote = F )
  }
}
