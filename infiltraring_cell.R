install.packages(c("devtools","curl"))
library(usethis)
library(devtools)
install_github("ebecht/MCPcounter",ref="master", subdir="Source")

my_data <- read.csv("data_RNA_Seq_v2_expression_median.txt", sep='\t')
nams <- c(my_data[,1])
rownames(my_data) <- make.names(nams, unique=TRUE)
 
data = subset(my_data, select = -c(1,2)) 
data <- na.omit(data)
result <- MCPcounter::MCPcounter.estimate(data, featuresType = "HUGO_symbols")
heatmap(as.matrix(result),col=colorRampPalette(c("white","blue","red"))(100)) 
write.table(result,file="infiltrating_cell")

?MCPcounter.estimate
?read.csv
?apply
