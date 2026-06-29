import pandas as pd
import numpy as np

# Load data
df = pd.read_csv('Raw_Data.csv')

# 1. Standardization
df['TREES NAME'] = df['TREES NAME'].str.strip().str.upper()
df['BLOCK'] = df['BLOCK'].str.strip().str.upper()

# Consolidate 'OURCAMPUS' and 'OUR CAMPUS'
df['BLOCK'] = df['BLOCK'].replace('OURCAMPUS', 'OUR CAMPUS')

# 2. Data Type Conversion
df['COUNT'] = pd.to_numeric(df['COUNT'], errors='coerce').fillna(0).astype(int)

# 3. Missing Value Handling
df['SCIENTIFIC NAME'] = df['SCIENTIFIC NAME'].fillna('Unknown').str.strip().str.upper()

# 4. Duplicate Removal
df = df.drop_duplicates()

# 5. Feature Engineering: Tree Category
category_map = {
    'MANGO': 'Fruit',
    'COCONUT': 'Fruit',
    'PAPAYA': 'Fruit',
    'BANANA': 'Fruit',
    'NEEM': 'Medicinal',
    'ALMOND': 'Fruit',
    'FIG': 'Fruit',
    'TAMARIND': 'Fruit',
    'GOLDEN BAMBOO': 'Ornamental',
    'ACACIA': 'Shade',
    'HAINANIA': 'Shade',
    'MONKEY POD': 'Shade',
    'INDIAN BEECH': 'Shade',
    'PALM': 'Ornamental',
    'ASIAN BULLET WOOD': 'Shade',
    'ASHOK': 'Shade',
    'BAMBOO': 'Ornamental'
}

def categorize_tree(name):
    for key, val in category_map.items():
        if key in name:
            return val
    return 'Other'

df['CATEGORY'] = df['TREES NAME'].apply(categorize_tree)

# Save cleaned data
df.to_csv('Dataset/Cleaned_Data.csv', index=False)
print("Cleaned data saved to Dataset/Cleaned_Data.csv")
