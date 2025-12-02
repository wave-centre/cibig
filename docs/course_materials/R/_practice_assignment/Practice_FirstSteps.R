# ---------------------------------
# PRACTICE (CIBIG 2025) 
# Koissi Savi and Damien
# ---------------------------------

# P1: Create a vector of gene expression values.  

# Write a loop that:
# labels each gene as "low","medium", or "high"
# uses thresholds of your choice



# Your data:
expr <- c(2, 15, 40, 8, 100)

# TODO: write your if + for solution

# P2: Sequence Length QC

# Given a vector of DNA sequences:

# Write a for loop that calculates their lengths
# Flag sequences shorter than 50 bp

seqs <- c("ATGC", "ATGCGGTTA", "AAGCTTAGCTAATGC")

# TODO: compute lengths + flags

# P3: Classroom Practice 3: Coverage Categorization

# Given sample read depths, write a loop to categorize each as:

# 1. "low" (< 10k)
# 2. "medium" (10k–30k)
# 3. "high" (> 30k)

depths <- c(5000, 12000, 45000, 8000, 25000)

# TODO: fill in your if/else + for loop
