#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape2)
library(ggplot2)

load("/home/bis180l_local/Shiny_Cassandra-Diane-Sarah/data_from_SNP_lab.Rdata")
data.pheno.mds <- merge(geno.mds, data.pheno, by = "row.names", all = TRUE)
colnames(data.pheno.mds)
#subset the data to only include the phenotypic traits of interest, popID and Region
data.pheno.mds1 <- subset(data.pheno.mds[,c(4,11,27,30,31,32,33,38)])
head(data.pheno.mds)

#melt the data
data.pheno.mds.melt <- melt(data.pheno.mds1)
colnames(data.pheno.mds.melt)

# Define server logic required to draw a violinplot
shinyServer(function(input, output) {
   
  output$violinPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = data.pheno.mds.melt[data.pheno.mds.melt$variable == input$trait,],
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="variable",
                            y="value",
                            fill=input$color)
    )
                 
    
    # draw the violinplot for the specified trait
      pl + geom_violin()
  
    })

  output$boxplot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = data.pheno.mds.melt[data.pheno.mds.melt$variable == input$trait,],
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="variable",
                            y="value",
                            fill=input$color)
    )
    
    
    # draw the scatterplot for the specified trait
      pl + geom_boxplot()
    })
  }
)