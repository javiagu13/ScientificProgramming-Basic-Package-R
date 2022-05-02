library(classInt)
library(Hmisc)
library(pROC)
library(ggplot2)


######################################Write and read datasets##################################

#'datasetReadRetyping
#'
#' @description it retypes the dataset from any kind of numbers to integer, factor or numeric
#'
#' each of the columns of the dataset will be converted to one of the mentioned types depending on its construction. If there are less than 5 values it would consider it as factor, it it has decimals as numeric, otherwise integer.
#'
#' @param data is the dataset
#' @return returns the actual retyped data

datasetReadRetyping<-function(data){
  for (i in 1:ncol(data)){
    data[,i]<-vecToDataType(data[,i])
  }
  return(data)
}


#'vecToDataType
#'
#' @description auxiliar function that helps the retype
#' @param vec is a vector to sort into integer, factor or numeric
#' @return it returns the vector retyped

vecToDataType <- function(vec){
  if(grepl(".", as.character(vec[1]),fixed=TRUE)){
    return(as.numeric(vec))
  }
  else if(length(rle(sort(vec))$values)<=5){
    return(as.factor(vec))
  }
  else{
    return(as.integer(vec))
  }
}
# #TEST
# data <- read.csv("C:\\Users\\Javi\\Documents\\UNI\\SME\\myCSV.csv",header=FALSE)
# newData<-datasetReadRetyping(data)
# class(newData[1,1])
# class(newData[1,2])
# class(newData[1,3])


#'writeDatasetCSV
#'
#' @description given a dataset and a root it creates the csv
#' @param data is the dataset
#' @param root is the root
#' @return creates a csv in the root directory
#'
writeDatasetCSV<-function(data, root){
  write.csv(data,root,row.names = FALSE)
}

#TEST
# numberCol1<-runif(10, min=0, max=1)
# numberCol1
# numberCol2<-runif(10, min=0, max=1)
# numberCol2
# data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
# data
# writeDatasetCSV(data, "C:\\Users\\Javi\\Documents\\UNI\\SME\\myCSV2.csv")
