
library(edgeR)

counts <- read.table('data/countsAKIECSCC.csv', sep=',', header=T)
classifications <- read.table('data/detail_classification_extended.txt', sep='\t', header=T)

classifications <- apply(classifications, 2, as.factor)
rownames(counts) <- counts$X 
counts <- counts[-1]

y <- DGEList(counts=counts)
y <- calcNormFactors(y)
y <- estimateCommonDisp(y)
y <- estimateTagwiseDisp(y)


