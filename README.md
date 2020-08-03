# BowString
R package for bag of word representation of string (especially DNA/proteins)
---
title: "BowString"
---
All the library that you need: 
```
library(BowString)
library(kmer)
library(ggplot2)
```

The two funcion that you need to use are "bow" and "bow_show". These two functions recall the function get_kmer and get_kmer_all and create a bar plot for the representation. For this reason youn need to install the libraries kmer and ggplot2. 
Here Below you can see an example. 
```{r}
s = "ATCGACTAGCGTGACGTGACGGTTGCA" # this is the fasta sequece 
n = 3 # this is the length of the kmers 
b <- bow(s,n)
bow_show(b)
```
