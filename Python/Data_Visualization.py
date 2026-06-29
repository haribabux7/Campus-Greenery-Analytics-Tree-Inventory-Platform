import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px

df = pd.read_csv('Dataset/Cleaned_Data.csv')

# Set style
sns.set_theme(style="whitegrid")

# 1. Top 10 Tree Species (Bar Chart)
plt.figure(figsize=(12, 6))
top_species = df.groupby('TREES NAME')['COUNT'].sum().sort_values(ascending=False).head(10)
sns.barplot(x=top_species.values, y=top_species.index, palette='viridis')
plt.title('Top 10 Most Common Tree Species on Campus')
plt.xlabel('Total Count')
plt.ylabel('Species Name')
plt.savefig('Reports/top_species.png')
plt.close()

# 2. Distribution of Trees by Block (Pie Chart)
plt.figure(figsize=(10, 8))
block_dist = df.groupby('BLOCK')['COUNT'].sum()
plt.pie(block_dist, labels=block_dist.index, autopct='%1.1f%%', startangle=140, colors=sns.color_palette('pastel'))
plt.title('Tree Distribution by Campus Block')
plt.savefig('Reports/block_distribution.png')
plt.close()

# 3. Category Analysis (Bar Chart)
plt.figure(figsize=(10, 6))
cat_dist = df.groupby('CATEGORY')['COUNT'].sum().sort_values(ascending=False)
sns.barplot(x=cat_dist.index, y=cat_dist.values, palette='magma')
plt.title('Total Trees by Category')
plt.xlabel('Category')
plt.ylabel('Count')
plt.savefig('Reports/category_analysis.png')
plt.close()

# 4. Species Diversity vs Total Trees (Scatter Plot)
plt.figure(figsize=(10, 6))
block_stats = df.groupby('BLOCK').agg({'COUNT': 'sum', 'TREES NAME': 'nunique'})
sns.scatterplot(data=block_stats, x='TREES NAME', y='COUNT', size='COUNT', hue='TREES NAME', legend=False, sizes=(100, 1000))
plt.title('Tree Diversity vs Total Count per Block')
plt.xlabel('Number of Unique Species')
plt.ylabel('Total Tree Count')
plt.savefig('Reports/diversity_scatter.png')
plt.close()

# 5. Heatmap of Species per Block
# Top 10 species and their count in each block
top_10_names = top_species.index.tolist()
heatmap_data = df[df['TREES NAME'].isin(top_10_names)].pivot_table(index='TREES NAME', columns='BLOCK', values='COUNT', aggfunc='sum').fillna(0)
plt.figure(figsize=(15, 8))
sns.heatmap(heatmap_data, annot=True, fmt=".0f", cmap='YlGnBu')
plt.title('Top 10 Species Distribution across Blocks')
plt.savefig('Reports/species_heatmap.png')
plt.close()

print("Visualizations saved to Reports/ directory.")
