import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

st.set_page_config(page_title="Campus Greenery Analytics", layout="wide")

st.title("🌿 Campus Tree Inventory Dashboard")
st.markdown("An end-to-end analysis of campus biodiversity and greenery distribution.")

# Sidebar
st.sidebar.header("Controls")
uploaded_file = st.sidebar.file_uploader("Upload Cleaned Data CSV", type=["csv"])

if uploaded_file is not None:
    df = pd.read_csv(uploaded_file)
    
    # Filters
    blocks = st.sidebar.multiselect("Select Blocks", options=df['BLOCK'].unique(), default=df['BLOCK'].unique())
    categories = st.sidebar.multiselect("Select Categories", options=df['CATEGORY'].unique(), default=df['CATEGORY'].unique())
    
    filtered_df = df[(df['BLOCK'].isin(blocks)) & (df['CATEGORY'].isin(categories))]
    
    # KPIs
    col1, col2, col3, col4 = st.columns(4)
    col1.metric("Total Trees", f"{filtered_df['COUNT'].sum():,}")
    col2.metric("Unique Species", filtered_df['TREES NAME'].nunique())
    col3.metric("Total Blocks", filtered_df['BLOCK'].nunique())
    col4.metric("Avg Trees/Species", f"{filtered_df['COUNT'].mean():.2f}")
    
    # Charts
    row1_col1, row1_col2 = st.columns(2)
    
    with row1_col1:
        st.subheader("Trees per Block")
        block_data = filtered_df.groupby('BLOCK')['COUNT'].sum().reset_index().sort_values('COUNT', ascending=False)
        fig_block = px.bar(block_data, x='BLOCK', y='COUNT', color='COUNT', color_continuous_scale='Greens')
        st.plotly_chart(fig_block, use_container_width=True)
        
    with row1_col2:
        st.subheader("Category Distribution")
        cat_data = filtered_df.groupby('CATEGORY')['COUNT'].sum().reset_index()
        fig_cat = px.pie(cat_data, values='COUNT', names='CATEGORY', hole=0.4, color_discrete_sequence=px.colors.sequential.Greens_r)
        st.plotly_chart(fig_cat, use_container_width=True)
        
    row2_col1, row2_col2 = st.columns(2)
    
    with row2_col1:
        st.subheader("Top 10 Species")
        spec_data = filtered_df.groupby('TREES NAME')['COUNT'].sum().reset_index().sort_values('COUNT', ascending=False).head(10)
        fig_spec = px.bar(spec_data, x='COUNT', y='TREES NAME', orientation='h', color='COUNT', color_continuous_scale='Viridis')
        fig_spec.update_layout(yaxis={'categoryorder':'total ascending'})
        st.plotly_chart(fig_spec, use_container_width=True)
        
    with row2_col2:
        st.subheader("Diversity vs Count")
        div_data = filtered_df.groupby('BLOCK').agg({'COUNT': 'sum', 'TREES NAME': 'nunique'}).reset_index()
        fig_div = px.scatter(div_data, x='TREES NAME', y='COUNT', size='COUNT', color='BLOCK', hover_name='BLOCK')
        st.plotly_chart(fig_div, use_container_width=True)
        
    st.subheader("Data View")
    st.dataframe(filtered_df)
    
else:
    st.info("Please upload the `Cleaned_Data.csv` file from the sidebar to begin analysis.")
    st.image("https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80")

