for(i in 1:nrow(temp)){
  print(i)
  x <-5:15
  if(i == 1){
    a <- NA
  } 
  b <- match(temp[i,2:ncol(temp)], x)
  a <-rbind(a, b) 
}
aaaaa <- cbind(temp$SampleID, a[2:nrow(a),])
rownames(aaaaa) <- 1:nrow(aaaaa)
vvv <- rowSums(is.na(aaaaa))
index_no <- names(vvv[vvv <= 4])
aaaaa[index_no,1]
