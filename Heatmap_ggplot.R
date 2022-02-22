# HEATMAP WITH OBSERVED EXPERIMENTAL ACTIVITY & RESPECTIVE WEIGHTS

# Load the data file EXP_DATA.csv with activity 
data <-  read.csv (file.choose())

# generate a matrix with the experimental data
M_SS <- data.matrix( data[, 2:ncol(data)])

# Names for each row in the matrix rows with stable states names from data text file. 
ss_lables <- data[,1]
rownames(M_SS) <- ss_lables


# Necessary graphical packages for proper heatmap.2 
require(grDevices)
if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)}


if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)}

if (!require("Matrix")) {
  install.packages("Matrix", dependencies = TRUE)
  library(Matrix)}


#Defining the colors used in the heatmap

Select_colors <- c ("gray", "yellow", "green")
Hmap_col <- colorRampPalette (Select_colors) (n =299)

#collor Limits for the heatmap

col_breaks = c (seq(0,0.99,length=100), seq(1,2,length=100), seq(3,5,length=100))
  

# heatmap generation  with nodes and states in 2 different positions    
# In alternative... a transpose of the heatmap by substitute M_SS fot t(M_SS) and adjust margins to (8,6)


            
heatmap.2 ( M_SS, col= Hmap_col, breaks=col_breaks,dendrogram="none",
           trace="none",tracecol="white", vline = NULL, hline = NULL,
            density.info="none", Colv=FALSE, Rowv ="none", notecol="black", margins = c(10,12), keysize=1.2, symkey=FALSE,  symbreaks=FALSE )



SUMS_OBSRV <- colSums(M_SS)

par(mar=c(8.8, 4.1,4.1,2.1))
    
barplot(SUMS_OBSRV, main= "Total number of observed activity for each node" ,col = c("purple"), cex.axis = 1.0 , cex.names = 0.7 , las=3,  ylim = c(0,30), ylab = "n observations" )

legend ("topright", phenotypes, col=Vcolor, lwd=6)
