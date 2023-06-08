# Name: Mellanie Martin
# Date: 3/8/23 - ??
# Status: INCOMPLETE
# File Description: 

# imports
library(Biostrings) # Biostrings; popular bioinformatics library


# GC content
gcContent <- function(DNASeq) {
  totNucs <- 0
  gcCount <- 0
  
  splitString <- strsplit(DNASeq, "")[[1]]
  
  for (k in splitString) {
    totNucs <- totNucs + 1 # counts the number of nucleotides in DNA string
    nucFreq <- as.data.frame(table(splitString))
    gcCount <- nucFreq[2, "Freq"] + nucFreq[3, "Freq"] # C is at row 2, G is at row 3
  }
  
  GCP <- gcCount/totNucs*100 # Get percentages
  
  return(GCP)
}

# Transcription of DNA to RNA
transcription <- function(DNASeq) {
  transcribed <- gsub("T", "U", DNASeq)
  return(transcribed)
}

# Translation from RNA to Protein String
translation <- function(RNA) {
  # Translate the RNA sequence to a protein using the translate function from the biostrings package
  RNA <- RNAStringSet(RNA)
  protein <- translate(RNA)
  return(protein)
}

# Reverse Complements a DNA String
revCompliment <- function(DNASeq) {
  splitSeq <- strsplit(DNASeq, "") [[1]]
  reverseChars <- rev(splitSeq) # reverse the string
  reversedSeq <- paste(reverseChars, collapse = "") # puts the split string of vectors back into a single string
  revComp <- chartr("ATCG", "TAGC", reversedSeq)
  return(revComp)
}

# Counts the number of nucleotides in a DNA String
nucleotideCount <- function(DNAseq) {
  totNucs <- 0
  
  splitString <- strsplit(DNASeq, "")[[1]]
  
  for (k in splitString) {
    totNucs <- totNucs + 1 # counts the number of nucleotides in DNA string
  }
  
  return(totNucs)
}

# Returns Nucleotide frequencies
nucFreq <- function(DNASeq) {
  genome <- DNAStringSet(DNASeq)
  alphabetFrequency(genome)
  freq <- alphabetFrequency(genome, as.prob = T)
  return(freq[,1:4]*100)
}