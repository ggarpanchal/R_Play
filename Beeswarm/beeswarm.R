## install.packages("beeswarm")
library(beeswarm)
A <- read.xlsx2("Demo_Sheet.xls",sheetIndex = 1,startRow = 2, header = F,stringsAsFactors = F,)
A$X1 <- as.factor(A$X1)
A$X2 <- as.numeric(A$X2)
A$X3 <- as.factor(A$X3)


AA <- A[A$X2 < 1,]
beeswarm(AA$X2 ~ AA$X1, pch =16, pwcol = AA$X3, corral = "omit", corralWidth = 1,spacing = 0.4, method =  "swarm", axes = F, xlab = "Samples", ylab = "Relative Abundance in %")
axis(2,at = seq(0,0.9, by = 0.1) )
axis(1,at = AA$X1, labels =  AA$X1)
## above code generate plot show as beeswarm_1.png (https://github.com/ggarpanchal/R_Play/blob/master/Beeswarm/Beeswarm_1.png)


AAA <- A[A$X2 > "0.9",]
beeswarm(AAA$X2 ~ AAA$X1, pch =16, pwcol = AAA$X3, corral = "omit", corralWidth = 1,spacing = 0.4, method =  "swarm", axes = F, xlab = "Samples", ylab = "Relative Abundance in %")
axis(2,at = seq(1,50, by = 5) )
axis(1,at = AAA$X1, labels =  AAA$X1)
## above code generate plot show as beeswarm_2.png (https://github.com/ggarpanchal/R_Play/blob/master/Beeswarm/Beeswarm_2.png)


legend("topright", legend = levels(AAA$X3), pch = 16, col = 1:3, text.width = 7)
## above code create legend as https://github.com/ggarpanchal/R_Play/blob/master/Beeswarm/Legand.JPG
