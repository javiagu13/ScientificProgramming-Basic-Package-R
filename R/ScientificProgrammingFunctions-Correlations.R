library(classInt)
library(Hmisc)
library(pROC)
library(ggplot2)



######################################Correlation calculus by pairs##################################

#'atributesCorrelation
#'
#' @description it uses spearman's method to calculate the correlation of the variables in a given dataframe
#' @param data is the dataset of two variables
#' @return returns the correlation based on spearman's method

atributesCorrelation<-function(data){
  mat<-data.matrix(data)
  corr<-cor(data, method = "spearman")
  ggplot(data.frame(corr)) +
    geom_tile()

  return(corr)
}

#TEST
 numberCol1<-runif(10, min=0, max=10)
 numberCol1
 numberCol2<-runif(10, min=0, max=10)
 numberCol2
 numberCol3<-runif(10, min=0, max=10)
 numberCol2
 data<-as.data.frame(matrix(c(numberCol1,numberCol2,numberCol3),ncol=3))

 atributesCorrelation(data)

######################################Plots for AUC and Mutual Information##################################

#'plotAUC
#'
#' @description it plots the area under the curve given a dataset of numbers and classes using a threshold as
#' in the previous AUC calculus.
#' @param data has two columns, the first of numbers where a threshold will be applied and the second
#' one of actual classes
#' @param threshold is the threshold to make true or false the values on the first column
#' @return AUC curve and AUC value
#'
plotAUC<-function(predictor,response){
  rocObj<-roc(response, predictor,percent=TRUE, plot=TRUE, ci=TRUE, auc=TRUE)
  return(rocObj$auc[1]*0.01)
}

 #Test
  numberCol<-runif(10, min=0, max=1)
  numberCol
  numberCol<-sort(numberCol, decreasing = TRUE)

  boolCol<-sample(c(TRUE,FALSE), 10, TRUE)
  boolCol

  data<-as.data.frame(matrix(c(numberCol,boolCol),ncol=2))
  data
  mat<-data.matrix(data)
  plotAUC(numberCol,boolCol)


#'plotMutualInformation
#'
#' @description plots mutual information correlation. Given a dataset of numbers it plots the percentage of each of the variables of the dataframe of having mutual information with the rest of the dataset.
#' @param data the dataset to be plotted
#' @param xVar x variable
#' @param yVar y variable
#' @return it returns the plot
#'
atributesMutualInformation<-function(data){
  data<-atributesCorrelation(data)
  newData<-rowMeans(data)
  barplot(newData, main="Percentage of Mutual information between the given variable and the rest of the dataset", xlab="Variable Name", ylab="Percentage of simminarity with the rest of the dataset")

  }

#TEST
 numberCol1<-runif(10, min=0, max=1)
 numberCol1
 numberCol2<-runif(10, min=0, max=1)
 numberCol2
 data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
 data
 mat<-data.matrix(data)


 atributesMutualInformation(data)
