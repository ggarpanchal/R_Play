temp <- read.csv("Phenotype.csv",header = T)
find_top <- function(x=5, min_select = 4){
for(i in 1:nrow(temp)){
  y <- 10
  x <- x:y
  if(i == 1){
    a <- NA
  } 
  b <- match(temp[i,2:ncol(temp)], x)
  a <-rbind(a, b) 
}
aaaaa <- cbind(temp$SampleID, a[2:nrow(a),])
rownames(aaaaa) <- 1:nrow(aaaaa)
vvv <- rowSums(is.na(aaaaa))
index_no <- names(vvv[vvv <= (ncol(temp)-1)-min_select])
aaaaa[index_no,1]
}
