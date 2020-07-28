# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#' get_kmer
#'
#'
#' @param x a string
#' @param n the length k
#'
#' @return a set of set of k-mer unique
#'
#' @examples
#' @export
get_kmer <- function(x, n)
{
  kmers <- unique(substring(x, 1:(nchar(x) - n + 1), n:nchar(x)))
  return(kmers)
}

#' get_kmer_all
#'
#'
#' @param x string
#' @param n length of the kmer
#'
#' @return list of kmer with repetition of each kmer.
#'
#' @examples
#' @export
get_kmer_all <- function(x, n)
{
  kmers <- (substring(x, 1:(nchar(x) - n + 1), n:nchar(x)))
  return(kmers)
}

#' bow
#'
#'
#'
#' @param s is the string or fasta sequence, of which you want the Bow representation
#' @param n is the length of the kmers
#'
#' @return a dataframe, representing the Bag of words of your string
#' @examples
#' @export
bow <- function(s,n)
{
  s <- gsub("\n", "", s) # to remove the \n if you put as a string a FASTA sequence.
  k_u <- get_kmer(s,n)
  k_all <- get_kmer_all(s,n)
  c <- kcount(k_all,1) # k count is a function from "kmer" library
  m <- matrix(c, nrow=length(c), ncol=1)
  kmer <- c(k_u)
  Bow = data.frame(kmer,m)

  return(Bow)
}

#' bow show
#'
#' @param Bow the dataframe returned by the function bow
#'
#' @return a barplot with the representation of your k-mer with respect to the mean.
#'
#' @examples
#' @export
bow_show <- function(Bow)
{
  avg <- mean(Bow$m)
  Bow$bool <- Bow$m > avg
  # i prefer to use fill to color all the bar of the histogram
  bow_r <- ggplot(Bow,aes(x=kmer,y=m))+geom_bar(aes(fill=bool),stat="identity")
  bow_r + labs(colour = "bigger than mean")
  return(bow_r)
}

