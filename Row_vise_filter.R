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




find_top <- function(value_above=5, min_select = 4){
  temp <- read.csv("Phenotype.csv",header = T)
  use_df <- sapply(temp[,2:ncol(temp)], function(x){ y <- value_above:10;match(x, y)})
  tidy_df <- cbind(temp$SampleID, use_df)
  tidy_df <- as.data.frame(tidy_df, stringsAsFactors = F)
  NA_df_filter <- rowSums(is.na(tidy_df))
  names(NA_df_filter) <- 1:nrow(temp)
  index_no <<- names(NA_df_filter[NA_df_filter <= (ncol(temp)-1)-min_select])
  tidy_df[index_no,1]
}
