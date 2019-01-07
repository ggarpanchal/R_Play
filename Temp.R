library (xlsx)
file_list = list.files( pattern="*.txt")
for(i in 1:length(file_list)){

xxxx <- c(strsplit(file_list[i],split = ".txt")[[1]],"xlsx")
Outfile_Name = paste(xxxx, collapse = ".")
A<- read.delim2(file = file_list[i],header = F)
for_sep <- (A[1,1:2])
v1 <- (capture.output(cat((unlist(strsplit(capture.output(for_sep)[2], split = " ")))[2:3])))
v2 <- (capture.output(cat((unlist(strsplit(capture.output(for_sep)[2], split = " ")))[4:6])))
v3 <- (capture.output(cat((unlist(strsplit(capture.output(for_sep)[2], split = " ")))[7:9])))
v4 <- (capture.output(cat((unlist(strsplit(capture.output(for_sep)[2], split = " ")))[10:12])))
A$V1 <- as.character(A$V1)
A$V2 <- as.character(A$V2)
A$V3 <- as.character(A$V3)
A$V4 <- as.character(A$V4)
A[1,1] <- v1
A[1,2] <- v2
A[1,3] <- v3
A[1,4] <- v4
A$V2[A$V2 == ""] <- c(NA)
A$V3[A$V3 == ""] <- c(NA)
A$V4[A$V4 == ""] <- c(NA)
write.xlsx2(x = A,file = Outfile_Name,sheetName = "Master", col.names = F,row.names = F,append = T)
A1 <- data.frame(A$V1, A$V2, stringsAsFactors = F)
##addWorksheet(wb,sheetName = A1[1,2])
write.xlsx2(x = na.omit(A1),file = Outfile_Name, sheetName = A1[1,2], col.names = F,row.names = F,append = T)
A2 <- data.frame(A$V1, A$V3, stringsAsFactors = F)
##addWorksheet(wb,sheetName = A2[1,2])
write.xlsx2(x = na.omit(A2),file = Outfile_Name, sheetName = A2[1,2], col.names = F,row.names = F,append = T)
A3 <- data.frame(A$V1, A$V4, stringsAsFactors = F)
##addWorksheet(wb,sheetName = A3[1,2])
write.xlsx2(x = na.omit(A3),file = Outfile_Name, sheetName = A3[1,2], col.names = F,row.names = F,append = T)
}
