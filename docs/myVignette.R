## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## -----------------------------------------------------------------------------
#' @description given an atribute vector it separates the values with equal frequency by giving a
#' number of steps.
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals

## -----------------------------------------------------------------------------
#' @description in dataset and it discretizes it equal frequency
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'

## -----------------------------------------------------------------------------
#' @description given an atribute vector it separates the values with equal width by giving a
#' number of steps.
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals

## -----------------------------------------------------------------------------
#' @description in dataset and it discretizes it equal width
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'

## -----------------------------------------------------------------------------
#' @description calculates the variance of every column of the dataset
#' @param data is the dataset
#' @return it returns the vector of variances being the first the one of the first column, the second of the second column...

## -----------------------------------------------------------------------------
#' @description calculates the AUC of every column of a dataset of two columns with a threshold
#' @param data is the dataset of two columns
#' @param threshold is the threshold to turn some data into true
#' @details having two columns, the second one is a column of true of false of the real class.
#' the first column, however, are values where up to some threshold will be false and the rest true, then the AUC is calculated
#' @return Area under the curve is returned

## -----------------------------------------------------------------------------
#' @description calculates the entropy of every column of the dataset
#' @param data is the dataset
#' @return it returns the entropy of variances being the first the one of the first column, the second of the second column...

## -----------------------------------------------------------------------------
#' @description normalizes the vector v (it reduces the numbers to 0-1 interval)
#' @param v the vector
#' @return returns a vector normalized

## -----------------------------------------------------------------------------
#' @description it estandarizes a vector
#' @param v is the vector
#' @return returns and estandarized vector

## -----------------------------------------------------------------------------
#' @description it normalizes a whole dataset column by column
#' @param data the data
#' @return returns the dataset normalized

## -----------------------------------------------------------------------------
#' @description it estandarizes a whole dataset column by column
#' @param data
#' @return returns the dataset estandarized

## -----------------------------------------------------------------------------
#' @description delete variables with variance lesser than var
#' @param data which is any given dataframe
#' @param var which is the threshold to delete a variable r not
#' @return returns the dataset with the filtering done

## -----------------------------------------------------------------------------
#' @description it uses spearman's method to calculate the correlation of two variables in a dataset
#' @param data is the dataset of two variables
#' @return returns the correlation based on spearman's method

## -----------------------------------------------------------------------------
#' @description it plots the area under the curve given a dataset of numbers and classes using a threshold as
#' in the previous AUC calculus.
#' @param data has two columns, the first of numbers where a threshold will be applied and the second
#' one of actual classes
#' @param threshold is the threshold to make true or false the values on the first column
#' @return AUC curve
#'

## -----------------------------------------------------------------------------
#' @description plots mutual information correlation
#' @param data the dataset to be plotted
#' @param xVar x variable
#' @param yVar y variable
#' @return it returns the plot
#'

## -----------------------------------------------------------------------------
#' @description it retypes the dataset from any kind of numbers to integer, factor or numeric
#' @param data is the dataset
#' @return returns the actual retyped data

## -----------------------------------------------------------------------------
#' @description given a dataset and a root it creates the csv
#' @param data is the dataset
#' @param root is the root
#' @return creates a csv in the root directory
#'

