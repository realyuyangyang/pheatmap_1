# Load library
library(pheatmap)
#Loading data
data1 <- read.table("C:/Users/Yangyang/Desktop/xyq/GSE106688_genes.fpkm_table.txt", 
                    header = TRUE, quote = '\t')
head(data1)
#To make data1 a numric dataframe but the rownames saved.
rownames(data1)=data1[,1]
data2 <- data1[,-1]
head(data2)
# Loading DEGs.
DEGs <- read.table("C:/Users/Yangyang/Desktop/xyq/DEGs.txt", quote="\"", comment.char="")
head(DEGs)
# Change colomn names
Col_Names <- c("hESC R1","hESC R2","MES R1","MES R2","CP R1","CP R2", 
               "CM R1", "CM R2", "Fetal R1", "Fetal R2")
names(data2)[1:10] <- Col_Names
head(data2)
# Filter a sub dataframe which only contain gene names in DEGs.
data3 <- data2[c(DEGs[,1]),]
head(data3)
#Drop rows that values are all zero.
#data = data[which(rowSums(data==0)==0),]
data4 = data3[which(rowSums(data3==0)==0),]
#data3 = log2(data3)(if necessary)
#pheatmap
pheatmap(data4, 
         scale = 'row', 
         gaps_col = 8,
         cluster_rows = T, 
         cluster_cols = T,
         cutree_cols = 1, 
         gaps_row = c(8, 9), 
         treeheight_row = 30, 
         treeheight_col = 30,
         show_rownames = F, 
         color = colorRampPalette(c("navy", "white", "yellow3"))(100))



























































