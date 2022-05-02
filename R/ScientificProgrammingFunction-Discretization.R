library(classInt)
library(Hmisc)
library(pROC)
library(ggplot2)
######################################Discretization##################################
#in vector and it discretizes it equal frequency
#atributeDiscretizeEF, datasetDiscretizeEF, atributeDiscretizeWF, datasetDiscretizeWF

intervalToInt <- function(interval) {
  print(interval)
  interval<-toString(interval)
  numberstring_split <- strsplit(interval, "")[[1]]
  number<-""
  for (char in numberstring_split) {
    if(char=="0"||char=="1"||char=="2"||char=="3"||char=="4"||char=="5"||char=="6"||char=="7"||char=="8"||char=="9"||char=="/."){
      print(char)
      number<-paste(number,char,sep="")
    }
    else if(char==","){break}
  }
  print(number)
  return(as.integer(number))
}

#'atributeDiscretizeEF
#'
#' @description given an atribute vector it separates the values with equal frequency by giving a
#' number of steps.
#'
#' As an example an vector like the following "bek<-c(2,13,1,18,3,8,4,20,7,5)" and a number "5" for instance will slice it in different ranges.
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals

atributeDiscretizeEF <- function(atribute, n_bins)
{
  n_bins_orig = n_bins
  res = cut2(atribute, g = n_bins)
  uq=unique(res)
  n_bins_final = length(uq)
  if (n_bins_final != n_bins & sum(is.na(uq))==0)
    warning(sprintf("It's not possible to calculate with n_bins=%s, setting n_bins in: %s.",
                    n_bins, n_bins_final))
  print(res)
  #Now lets obtain the numeric vector
  cut.points<-c()
  for (i in 1:length(res)){
    if(intervalToInt(res[i]) %in% cut.points ==FALSE)
      cut.points<-c(cut.points, intervalToInt(res[i]))
  }
  #auxiliar array where the first value must be a bit less than actual
  #for a good functioning of cut function
  if(max(atribute)%in% cut.points ==FALSE){
    cut.points<-c(cut.points,max(atribute))
  }
  cut.points<-sort(cut.points, decreasing=FALSE)
  aux<-cut.points
  aux[1]<-aux[1]-0.1
  print(cut.points)
  x.discretized<- cut(atribute, breaks = aux, labels = FALSE)
  #return(list(x.discretized, res))
  return(res)
}



atributeDiscretizePrivateEF <- function(atribute, n_bins)
{
  n_bins_orig = n_bins
  res = cut2(atribute, g = n_bins)
  uq=unique(res)
  n_bins_final = length(uq)
  if (n_bins_final != n_bins & sum(is.na(uq))==0)
    warning(sprintf("It's not possible to calculate with n_bins=%s, setting n_bins in: %s.",
                    n_bins, n_bins_final))
  print(res)
  #Now lets obtain the numeric vector
  cut.points<-c()
  for (i in 1:length(res)){
    if(intervalToInt(res[i]) %in% cut.points ==FALSE)
      cut.points<-c(cut.points, intervalToInt(res[i]))
  }
  #auxiliar array where the first value must be a bit less than actual
  #for a good functioning of cut function
  if(max(atribute)%in% cut.points ==FALSE){
    cut.points<-c(cut.points,max(atribute))
  }
  cut.points<-sort(cut.points, decreasing=FALSE)
  aux<-cut.points
  aux[1]<-aux[1]-0.1
  print(cut.points)
  x.discretized<- cut(atribute, breaks = aux, labels = FALSE)
  return(list(x.discretized, res))

}

#Test
# bek<-c(2,13,1,18,3,8,4,20,7,5)
#
# result<-atributeDiscretizeEF(bek, 5)
# result



#'datasetDiscretizeEF
#'
#' @description in dataset and it discretizes it equal frequency
#'
#' As an example, a given numeric dataframe of any size is inputed and a number like "5" for instance will slice the whole dataset in different ranges.
#'
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'
datasetDiscretizeEF <- function(data, num.bins) {
  mat<-as.matrix(data) #algun problema aqui interpreto
  numberOfCol<-length(mat[,1])
  for (i in 1:numberOfCol){
    print(mat[,i])
    mat[,i]<-atributeDiscretizePrivateEF(mat[,i],num.bins)[[1]]
  }

  return(mat)
}

#Test
# mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
# data<-as.data.frame(mat)
#
# data
# datasetDiscretizeEF(data,5)



#'atributeDiscretizeEW
#'
#' @description given an atribute vector it separates the values with equal width by giving a
#' number of steps.
#'
#' As an example an vector like the following "bek<-c(2,13,1,18,3,8,4,20,7,5)" and a number "5" for instance will slice it in different ranges.
#'
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals

atributeDiscretizeEW <- function(atribute, num.bins) {
  classIntervals(atribute, num.bins)
  x.discretized <- classIntervals(atribute, num.bins, style = 'equal')
  cut.points<-x.discretized$brks
  #auxiliar array where the first value must be a bit less than actual
  #for a good functioning of cut function
  aux<-cut.points
  aux[1]<-aux[1]-0.1
  x.discretized<- cut(atribute, breaks = aux, labels = FALSE)
  return(list(x.discretized, cut.points))
}

#Test
# result<-atributeDiscretizeEW(1:10, 5)
# result

#'datasetDiscretizeEW
#'
#' @description in dataset and it discretizes it equal width
#'
#' As an example, a given numeric dataframe of any size is inputed and a number like "5" for instance will slice the whole dataset in different ranges.
#'
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'
datasetDiscretizeEW <- function(data, num.bins) {
  mat<-as.matrix(data) #algun problema aqui interpreto
  numberOfCol<-length(mat[,1])
  for (i in 1:numberOfCol){
    print(mat[,i])
    mat[,i]<-atributeDiscretizeEW(mat[,i],num.bins)[[1]]
  }

  return(mat)

}

#Test
# mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
# data<-as.data.frame(mat)
#
# data
# datasetDiscretizeEW(data,5)


