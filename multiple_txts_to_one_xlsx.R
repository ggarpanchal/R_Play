# <first R_Play code>
# this code help to combine multiple text files (txt) as sperate sheets in one single excel file (xlsx)   
# Author : Ggarpanchal <panchal.jigar90@gmail.com>
# for use this function we have to install a package "xlsx" .
# You have not this package then run this "install.packages("xlsx")" in r console.
# before run this code set working directory where your txt files located
library(xlsx)
txt_files_one_xlsx <- function ( file_name = "Output.xlsx", Header_txt = c(T,F)){
  # file_name for output file name
  file_list = list.files( pattern="*.txt")
  # file_list contain all txt(default seprated by TAB) extention files of current R active directory 
  for(i in 1:length(file_list)){ 
        # for loop run untill file_list 
        temp <- read.delim(file = file_list[i], header = Header_txt)
        # temp store a temporary data.frame of import txt file data 
        write.xlsx2(x = temp,file = file_name ,sheetName = (strsplit(x = file_list[i], split = ".txt")[[1]]),col.names = F, row.names = F, append = T)
        # this line create a excel file with given file name, take input data from data.frame temp , sheetName contain your single text input file
        # name without txt extention by default colname and rowname is FALSE , append is important use for a logical value indicating if input_data
        # should be appended to an existing file.
  }
}
