#! /usr/bin/env Rscript

system('mkdir -p tmp')
system('LC_CTYPE=C sed -e "/^;;;/d" -e "s/ /|/"  < cmudict-0.7b > tmp/cmudict.tsv')

# not sure why but really really slow... 
# data <- read.table('cmudict.tsv', header=FALSE, sep="\n", delim="|", colClasses="character",
#                   comment.char = "", stringsAsFactors=FALSE,row.names=10,col.names=c("Word", "Pronounciation"))

Sys.setlocale('LC_ALL','C') 
data <- scan('tmp/cmudict.tsv', sep="\n", what="character")
rows <- lapply(data, strsplit, split="\\|")
df <- data.frame(pronounciation=sapply(strsplit(data, '\\|'), "[[", 2), stringsAsFactors=FALSE)
rownames(df) <- sapply(strsplit(data, '\\|'), "[[", 1)

system('mkdir -p ../data')
save(df, file="../data/cmudict.rda")