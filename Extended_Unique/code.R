# Author : Ggarpanchal
# this R script needed following packages : "data.table", "gtools", "xlsx"

library(data.table)

raw_data <- fread("SNP_gene_QTL_intersect.txt",select = c(1,2,5,10))
raw_data <- raw_data[,c(4,1,2,3)]
x  <<- capture.output(
  for(i in unique(raw_data$V10)){
    Gname <- i;
    #print(Gname);
    g_data <- raw_data[raw_data$V10 == Gname,];
    # print(head(g_data, n=2));
    chormo_name <- unique(g_data$V1)
    for(j in chormo_name){
      chromo <- j;
      #print(chromo);
      c_data<- g_data[g_data$V1 == chromo,]
      # print(head(c_data, n=2));
      read_a  <- length(unique(c_data$V2))
      read_b  <- length(unique(c_data$V5))
      print(paste(Gname, chromo, read_a, read_b))
    }
  }
)
front_x <- substr(x,6,stop = nchar(x))
crop_x <- substr(front_x,1,stop = (nchar(front_x)-1))
#head(crop_x)
aaaa<-  as.data.frame(matrix( unlist(strsplit(crop_x, " ")), nrow=length(crop_x), byrow = T), stringsAsFactors = F)
aaaa[,3] <- as.numeric(aaaa[,3])
aaaa[,4] <- as.numeric(aaaa[,4])
names(aaaa) <- c("QTL", "V2", "V3", "V4")
a <- dcast(aaaa, QTL ~ V2, value.var = "V3")
aa <- dcast(aaaa, QTL ~ V2, value.var = "V4")

library("gtools")
a <- na.replace(a,replace = 0)
aa <- na.replace(aa,replace = 0)
a <- a[,c("QTL",mixedsort(names(a)[-1]))]
aa <- aa[,c("QTL",mixedsort(names(aa)[-1]))]

library(xlsx)
write.xlsx(a, "outpul.xlsx", sheetName = "SNP_Count", append = T)
write.xlsx(aa, "outpul.xlsx", sheetName = "Gene_Count", append = T)
