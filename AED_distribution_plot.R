## plot AED
## grep '>' *maker.proteins.fasta | awk '{print $1":"$4}' | perl -ne '@array=split(":", $_); @name=split("-",$array[0]);print $name[1]."\t".$array[2];' > eAED_statistics*
setwd("")
library(ggplot2)
## Frequency function
get_Freq <- function(table2check) {
  
  breaks = seq(0, 1, by=0.02) 
  AED_table <- table(table2check)
  AED_frame <- as.data.frame(AED_table)
  AED.cut = cut(table2check$V2, breaks, right=FALSE) 
  AED.freq = table(AED.cut)
  cumfreq = c(0, cumsum(AED.freq)/sum(AED.freq)) 
  
  return(cumfreq)  
}

## file1
file2check <- "Aed.output"
AED1 <- read.table(file2check)
mean_AED1 = mean(AED1$V2)
median_AED1 = median(AED1$V2)
cumfreq_Ret1 <- get_Freq(AED1)
breaks = seq(0, 1, by=0.02) 

qplot(breaks,cumfreq_Ret1,geom='line',ylab="Cummulative Fraction of Annotation", xlab="AED")+
  theme_bw()
