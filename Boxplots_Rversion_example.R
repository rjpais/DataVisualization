# Multifactorial ordered boxplot of data from two groups of samples  


# open the data from csv files 


# select the csv files with data  
# needs to add correct data column intervals for positive and negative groups   

DATAin <-  read.csv (file.choose())

Positive <- as.data.frame(DATAin[2:54, 1:ncol(DATAin)-1])
negative <- as.data.frame(DATAin[55:ncol(DATAin), 1: ncol(DATAin)-1])
S = ncol(DATAin)-1

NAMES <- c(seq(1,ncol(DATAin)-1, by = 1))


Feature <-c ("Y Lable to add")





#==================================================================================================================

# Boxplots data

par(mar=c(5,5,4,2), mfrow=c(3,1) )


extrems <- c (min(Positive),max(Positive) , min(negative), max(negative) )

M = max(extrems)
m = min(extrems)

plotPositive = boxplot(Positive,  data = Positive, boxwex=0.5,  ylab=Feature,
                       main="Positive  outcome" , col=c("gray"), ylim = c(m,M) , las = 1 )


# Add a legend
legend ("topright", legend = c("Normal"), col=c("green"),
        pch = 15, pt.cex = 3, cex = 1.3,  horiz = FALSE, bty = "n" , inset = c(0, 0) )


plotNegative = boxplot(negative,  data = negative, boxwex=0.5,  ylab=Feature,
                       main="Negative  outcome" , col=c("Turquoise4"), ylim = c(m,M), las = 1)


# Add a legend
legend ("topright", legend = c("Negative"), col=c("red"),
        pch = 15, pt.cex = 3, cex = 1.3,  horiz = FALSE, bty = "n" , inset = c(0, 0) )




#==================================================================================================================
