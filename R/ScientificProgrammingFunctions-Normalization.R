library(classInt)
library(Hmisc)
library(pROC)
library(ggplot2)


######################################Normalization and Estandarization##################################

#'variableNormalization
#'
#' @description normalizes the vector v (it reduces the numbers to 0-1 interval)
#' @param v the vector
#' @return returns a vector normalizeda and its maximum and minumum

variableNormalization<-function(v){
  v.norm <- (v - min(v)) / (max(v) - min(v))
  return(list(v.norm,min(v),max(v)))
}
#test
# numberCol1<-runif(10, min=0, max=10)
# numberCol1
#
# variableNormalization(numberCol1)


#'variableEstandarization
#'
#' @description it estandarizes a vector
#' @param v is the vector
#' @return returns and estandarized vector

variableEstandarization<-function(v){
  v.est <- (v-mean(v)) / sd(v)
  return(v.est)
}
# #TEST
# numberCol1<-runif(10, min=0, max=10)
# numberCol1
# variableEstandarization(numberCol1)


#'datasetNormalization
#'
#' @description it normalizes a whole dataset column by column
#' @param data the data
#' @return returns the dataset normalized

datasetNormalization<-function(data){
  mat<-as.matrix(data)
  numberOfCol<-length(mat[1,])
  row<-nrow(data)
  col<-ncol(data)
  normalizedVector<-variableNormalization(c(mat))[[1]]
  mat<-matrix(normalizedVector,ncol=col)

  return(mat)
}
#TEST
numberCol1<-runif(10, min=0, max=10)
numberCol1
numberCol2<-runif(10, min=0, max=10)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
data
normalized<-datasetNormalization(data)
normalized

#'datasetEstandarization
#'
#' @description it estandarizes a whole dataset column by column
#' @param data
#' @return returns the dataset estandarized
datasetEstandarization<-function(data){
  mat<-as.matrix(data)
  numberOfCol<-length(mat[1,])
  row<-nrow(data)
  col<-ncol(data)
  normalizedVector<-variableEstandarization(c(mat))
  mat<-matrix(normalizedVector,ncol=col)

  return(mat)
}
#TEST
numberCol1<-runif(10, min=0, max=10)
numberCol1
numberCol2<-runif(10, min=0, max=10)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
data
estandarized<-datasetEstandarization(data)
estandarized
