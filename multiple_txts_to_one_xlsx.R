#
#
#
#
#
#
#
#
# for use this function we have to install a package "xlsx"
libr
txt_files_one_xlsx <- function ( file_name = "Output.xlsx" ){
  # file_name for output file name
  file_list = list.files( pattern="*.txt")
  # file_list contain all txt(default seprated by TAB) extention files of current R active directory 
  for(i in 1:length(file_list)){
        temp <- read.delim(file = file_list[i],header = F)
        # temp store a temporary data.frame of import txt file data 
        write.xlsx2(x = temp,file = file_name ,sheetName = (strsplit(x = file_list[i], split = ".txt")[[1]]),col.names = F, row.names = F, append = T)
  }
}
