library(dplyr)
library(ggplot2)

options(scipen=10000)
species_level = as.data.frame(read.csv("ggplot2_stack_bar_plot_dataset.csv", header = FALSE))
species_level <- as.data.frame(t(species_level), stringsAsFactors = F) 
species_level <- species_level[1:(nrow(species_level)-3),]
species_level <- mutate(species_level, index = V2[1])
species_level <- species_level[2:nrow(species_level),]
species_level$V2 <- as.numeric(species_level$V2)
species_level <- arrange(species_level, desc(V2))
names(species_level) <- c("Organism", "Count", "Sample_name")
species_level <- mutate(species_level, Percentage = Count*100/sum(Count), Percentage = round(Percentage, digits = 2))
species_level_1 <- rbind(species_level[1:10,] , c("Other", sum(species_level$Count[11:nrow(species_level)]), species_level$Sample_name[1], sum(species_level$Percentage[11:nrow(species_level)])))
View(species_level_1)

species_level_1$Count <- as.numeric(species_level_1$Count)
species_level_12 <- cbind(species_level_1 , cnumber=1:11)
View(species_level_12)
#species_level_12$Organism <- factor(species_level_1$Organism,levels = 1:nrow(species_level_1))
species_level_12$Organism <- factor(species_level_1$Organism, levels=species_level_1$Organism)
#levels(species_level_12$Organism) <- species_level_1$Organism
View(species_level_12)
lapply(species_level_12, class)

plot_1 <- ggplot(data = species_level_12, aes(y = Count, x=Sample_name, fill=Organism)) + geom_bar(stat="identity") +
          geom_text(aes(label = (paste0(Percentage,"%"))), position = "stack", vjust=1.3)
plot_1
