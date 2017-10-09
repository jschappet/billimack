library(readr)


filename_map <- read_csv("~/rSource/billimack/filename.map.csv", 
   col_names = c("file_id","file_name","Barcode")) 


readRnaFile <- function(input) {
  #print(input)
  data <- read_tsv(paste("./rna/",input$file_id,"/",input$file_name, sep=""), col_names = c("gene_id",input$Barcode) )
  data
}

nrow(filename_map)

df <- readRnaFile(filename_map[1,])

for (i in 2:nrow(filename_map)) {
  newData <- readRnaFile(filename_map[i,])
  df <- merge(df, newData,by="gene_id")
  
}

