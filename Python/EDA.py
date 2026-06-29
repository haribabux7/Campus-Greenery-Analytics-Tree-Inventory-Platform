import pandas as pd
import numpy as np

df = pd.read_csv('Dataset/Cleaned_Data.csv')

print("--- Descriptive Statistics ---")
print(df['COUNT'].describe())

print("\n--- Total Trees by Block ---")
block_counts = df.groupby('BLOCK')['COUNT'].sum().sort_values(ascending=False)
print(block_counts)

print("\n--- Top 10 Most Common Tree Species ---")
species_counts = df.groupby('TREES NAME')['COUNT'].sum().sort_values(ascending=False)
print(species_counts.head(10))

print("\n--- Tree Category Analysis ---")
cat_counts = df.groupby('CATEGORY')['COUNT'].sum().sort_values(ascending=False)
print(cat_counts)

print("\n--- Species Diversity per Block ---")
diversity = df.groupby('BLOCK')['TREES NAME'].nunique().sort_values(ascending=False)
print(diversity)

print("\n--- Correlation (Numeric) ---")
# Not much numeric data here, but we can check correlation between species count and variety per block
block_stats = df.groupby('BLOCK').agg({'COUNT': 'sum', 'TREES NAME': 'nunique'})
print(block_stats.corr())

# Finding the block with the most diversity
most_diverse_block = diversity.idxmax()
print(f"\nMost Diverse Block: {most_diverse_block}")
