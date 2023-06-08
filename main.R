# Name: Mellanie Martin
# Date: 3/8/23 - ??
# Status: INCOMPLETE
# General Program Description: Program that takes pre-processed Raw Sequence Data and performs a number of analyses

# imports
library(Biostrings) # Biostrings; popular bioinformatics library
source("numericalAnalyses.R")

# Step 1: Read in data file
DNASeq <- readLines("input.txt", warn = FALSE)

# Step 2: Analyze file contents
if (length(input) == 0) { # make sure file has data in it
  print("ERROR: File has no reads. Please try again with a different file or populate chosen file.")
  next
} 

# Step 3: Compile data report
outputFile = "Data Report.txt"
print("Compiling report...")

# append nucleotide count to data report
nucleotideCount <- nucleotideCount(DNASeq)
cat("Total number of nucleotides:\n", file = outputFile)
cat(nucleotideCount, file = outputFile, append = TRUE)

# append Nucletoide frequencies to data report
frequencies <- nucFreq(DNASeq)
cat("\n\nNucleotide Frequencies % (A, G, C, and T respectively):\n", file = outputFile, append = TRUE)
cat(frequencies, file = outputFile, append = TRUE)

# append DNA reverse complement to data report
complementedDNA <- revCompliment(DNASeq)
cat("\n\nReverse Complemented DNA data:\n", file = outputFile, append = TRUE)
cat(complementedDNA, file = outputFile, append = TRUE)

# append GC content to data report
gcContent <- gcContent(DNASeq)
cat("\n\nGC Content:\n", file = outputFile, append = TRUE)
cat(gcContent, file = outputFile, append = TRUE)

# append transcription data to data report
RNA <- transcription(DNASeq)
cat("\n\nTranscribed DNA to RNA:\n", file = outputFile, append = TRUE)
cat(RNA, file = outputFile, append = TRUE)

# append translation data to data report
protein <- translation(RNA)
cat("\n\nTranslated RNA to its corresponding protein sequence:\n", file = outputFile, append = TRUE)
cat(as.character(protein), file = outputFile, append = TRUE)