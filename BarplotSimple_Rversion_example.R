# Simple barplot using R


pValues <- c(0.001, 0.002, 0.03, 0.04, 0.05, 0.3, 0.0001, 0.8, 0.004  )

barplot(pValues, 
        cex.axis = 1 , 
        cex.names = 1.1 , 
        ylim = c(0.0001,1), 
        col = c("Turquoise4"), 
        space=1, 
        main= "U tests results", 
        log = "y", 
        ylab= "p-value" )

