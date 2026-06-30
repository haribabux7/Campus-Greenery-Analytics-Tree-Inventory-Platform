
# 🌳 CampusCanopy — Campus Greenery Analytics & Tree Inventory Platform

> An end-to-end data analytics project that maps, cleans, analyzes and visualizes the biodiversity of a college campus — turning a hand-collected tree census into an interactive decision-support dashboard for sustainability and facilities teams.

CampusCanopy began as a simple field exercise: walking through every block of the campus and counting trees. What started with notebooks and spreadsheets quickly grew into a structured pipeline — raw block-level CSVs were consolidated, cleaned with Python and SQL, explored through EDA, mapped to categories (Fruit, Shade, Flowering, Medicinal, Ornamental), and finally surfaced through a Streamlit dashboard with rich Plotly visualisations.

The result is a portfolio-grade analytics project that demonstrates the full data lifecycle — ingestion, cleaning, modelling, querying, visualisation and storytelling — built around a real-world dataset that matters: the green cover of a living campus.


## 📖 Overview

**Purpose.** CampusCanopy quantifies the greenery of an educational campus block-by-block. It answers the kind of questions that sustainability committees, facilities managers and ecology clubs actually ask: *Which block has the most trees? Where do we lack shade? How many fruit-bearing species do we have? Which species dominate our biodiversity index?*

**Business value.** Most institutions have no structured record of their tree assets. CampusCanopy turns informal counts into a queryable dataset, enabling data-driven plantation drives, carbon-sink estimation, and ESG / NAAC / Green Campus reporting.

**User benefits.**
- A single source of truth for the campus tree census.
- Self-serve filters by block and category — no SQL knowledge needed.
- Reproducible cleaning + EDA scripts in both Python and SQL.
- Notebook walkthroughs that double as a teaching resource for students.

**Main functionality.**
1. Consolidate raw block-wise CSVs into a single cleaned dataset.
2. Standardise tree names, fix typos, normalise categories.
3. Run statistical and exploratory analyses (EDA).
4. Visualise distributions, top species, block-level density.
5. Serve everything through an interactive Streamlit dashboard.

---

## ✨ Features

### Core Features
- ✅ Block-wise tree inventory (A, B, C, D, E Blocks, Ground, ICSE, St. Michael's, St. Patrick's, Parking)
- ✅ Automated data cleaning & deduplication pipeline (Python + SQL)
- ✅ Category classification — Fruit, Shade, Flowering, Medicinal, Ornamental
- ✅ Interactive Streamlit dashboard with KPI cards and dynamic charts
- ✅ Reproducible Jupyter notebooks for charts, mapping and species lists

### User Features
- ✅ Multi-select filters for blocks & categories
- ✅ Live KPIs: total trees, unique species, blocks covered, average trees/species
- ✅ Drill-down by block, by category, by species
- ✅ CSV upload — point the dashboard at any compatible dataset
- ✅ Export-ready Plotly charts

### Admin / Analyst Features
- ✅ SQL business-query bank for ad-hoc reporting
- ✅ Pre-built EDA script that profiles the dataset on demand
- ✅ Data-cleaning scripts versioned in both Python and SQL flavours

### Advanced Features
- ✅ Donut + bar combinations for proportional analysis
- ✅ Top-N species ranking with colour-graded intensity scales
- ✅ Category-vs-block cross-tab visualisations
- ✅ Notebook-based mapping module for spatial distribution

### Security & Data Hygiene Features
- ✅ Input validation on uploaded CSVs (schema + dtype checks)
- ✅ Read-only dashboard — no destructive operations exposed
- ✅ Environment-variable driven DB credentials (no secrets in code)
- ✅ Parameterised SQL queries to prevent injection in analyst workflows

---

## 🧰 Tech Stack

### Frontend / Presentation
- **Streamlit** — interactive dashboard UI
- **Plotly Express & Graph Objects** — interactive charts
- **Markdown / HTML** — narrative content within the app

### Backend / Data Processing
- **Python 3.10+** — primary language
- **Pandas** — data wrangling
- **NumPy** — numeric operations
- **OpenPyXL** — Excel ingestion

### Database
- **MySQL / PostgreSQL** — for the SQL pipeline (`Data_Cleaning.sql`, `EDA.sql`, `Business_Queries.sql`)
- **SQLite** — lightweight local alternative

### Data Analytics
- **Jupyter Notebooks** — CHARTS, LIST, MAPPING
- **Matplotlib / Seaborn** — static exploratory plots
- **Plotly** — interactive analytics

### DevOps & Deployment
- **Streamlit Community Cloud** — primary hosting target
- **Docker** — reproducible environment (optional)
- **GitHub Actions** — CI for linting & smoke tests

### Development Tools
- **VS Code**, **Jupyter Lab**, **DBeaver**, **Git & GitHub**, **pytest**, **black**, **flake8**

---

## 🏗️ Architecture

```
┌─────────────────────┐
│   Raw Block CSVs    │  ← Field-collected data (per block / building)
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐       ┌──────────────────────┐
│ Data_Cleaning.py /  │──────▶│  Cleaned_Data.csv    │
│ Data_Cleaning.sql   │       │  (single source)     │
└─────────────────────┘       └──────────┬───────────┘
                                         │
              ┌──────────────────────────┼───────────────────────────┐
              ▼                          ▼                           ▼
     ┌─────────────────┐      ┌────────────────────┐      ┌────────────────────┐
     │  EDA.py / .sql  │      │ Data_Visualization │      │  Business_Queries  │
     └────────┬────────┘      └─────────┬──────────┘      └─────────┬──────────┘
              │                         │                           │
              └──────────────┬──────────┴───────────────────────────┘
                             ▼
                  ┌─────────────────────┐
                  │  Streamlit Dashboard│
                  │   (Dashboard.py)    │
                  └─────────────────────┘
```

- **System Architecture:** classic ETL → Analyze → Serve.
- **Application Flow:** CSV upload → in-memory Pandas frame → filter widgets → Plotly render.
- **Client–Server Communication:** Streamlit handles the websocket-based reactive loop; no separate API layer required for the dashboard.
- **Database Relationships:** flat denormalised fact table `trees(block, name, scientific_name, count, category)`; optional `categories` and `blocks` dimension tables for star-schema reporting.

---

## 📁 Project Structure

```
campuscanopy/
│
├── Dataset/
│   ├── Cleaned_Data.csv              # Final cleaned dataset
│   └── raw data/                     # Original per-block CSV/XLSX files
│
├── Python/
│   ├── Dashboard.py                  # Streamlit interactive dashboard
│   ├── Data_Cleaning.py              # Consolidation & cleaning pipeline
│   ├── Data_Visualization.py         # Static & interactive plots
│   ├── EDA.py                        # Exploratory data analysis
│   ├── CHARTS.ipynb                  # Chart-building notebook
│   ├── LIST.ipynb                    # Species & block lists
│   └── MAPPING.ipynb                 # Spatial mapping notebook
│
├── SQL/
│   ├── Data_Cleaning.sql             # SQL-side cleaning queries
│   ├── EDA.sql                       # Profiling & exploration queries
│   └── Business_Queries.sql          # Reporting / KPI queries
│
├── docs/
│   └── screenshots/                  # README assets
│
├── tests/                            # Unit tests for cleaning & EDA
├── requirements.txt                  # Python dependencies
├── .env.example                      # Example environment file
└── README.md
```

**Folder guide**
- `Dataset/` — raw and cleaned data, treated as immutable inputs.
- `Python/` — all executable analytics: pipeline, EDA, dashboard.
- `SQL/` — mirror of the Python pipeline for SQL-first analysts.
- `docs/` — screenshots, diagrams, supplementary docs.
- `tests/` — pytest suite for regression protection on the cleaning logic.

---

## ⚙️ Installation

### Prerequisites
- Python **3.10+**
- pip / venv
- MySQL or PostgreSQL (optional — only for the SQL workflow)
- Git

### 1. Clone the repository
```bash
git clone https://github.com/haribabux7/campuscanopy.git
cd campuscanopy
```

### 2. Create a virtual environment
```bash
python -m venv .venv
source .venv/bin/activate        # macOS / Linux
.venv\Scripts\activate           # Windows
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

If `requirements.txt` is not present, install the core stack:
```bash
pip install streamlit pandas numpy plotly matplotlib seaborn openpyxl
```

### 4. Configure environment variables
```bash
cp .env.example .env
# then edit .env with your local values
```

### 5. Launch the dashboard
```bash
streamlit run Python/Dashboard.py
```

Then open <http://localhost:8501> and upload `Dataset/Cleaned_Data.csv`.

---

## 🔐 Environment Variables

Create a `.env` file in the project root:

```env
PORT=8501
DATABASE_URL=postgresql://user:password@localhost:5432/campuscanopy
MONGO_URI=mongodb://localhost:27017/campuscanopy
JWT_SECRET=replace-with-a-long-random-string
API_KEY=your-third-party-api-key
EMAIL_HOST=smtp.gmail.com
EMAIL_USER=your-email@example.com
EMAIL_PASSWORD=your-app-password
```

| Variable | Purpose |
|---|---|
| `PORT` | Port for the Streamlit dashboard (default 8501). |
| `DATABASE_URL` | Connection string for the SQL backend used by `EDA.sql` / `Business_Queries.sql`. |
| `MONGO_URI` | Optional NoSQL store for future species metadata. |
| `JWT_SECRET` | Used if an authenticated admin layer is added. |
| `API_KEY` | Reserved for external integrations (e.g. plant-image APIs). |
| `EMAIL_HOST` / `EMAIL_USER` / `EMAIL_PASSWORD` | SMTP credentials for scheduled report emails. |

---

## 🧭 Usage

**Typical workflow**
1. Drop new block-wise CSVs into `Dataset/raw data/`.
2. Run `python Python/Data_Cleaning.py` to regenerate `Cleaned_Data.csv`.
3. Run `python Python/EDA.py` to print profiling summaries.
4. Launch `streamlit run Python/Dashboard.py`.
5. Filter by block / category and screenshot insights for reports.

**Example scenarios**
- *Sustainability audit:* identify blocks with the lowest shade-tree density.
- *Plantation planning:* find under-represented categories per block.
- *Academic project:* use the notebooks as teaching material for an EDA course.
- *NAAC / ESG reporting:* export KPI cards for institutional reports.

**Best practices**
- Treat `Dataset/raw data/` as append-only.
- Re-run cleaning after every new survey.
- Commit notebooks with outputs cleared for clean diffs.

---

## 🔌 API Reference (Analytical Layer)

The dashboard is self-contained, but the cleaning + EDA modules expose a small Python API.

| Method | Function | Description |
|---|---|---|
| `GET` | `load_data(path)` | Reads a CSV and returns a validated DataFrame. |
| `POST` | `clean_dataset(df)` | Applies cleaning rules and returns a cleaned frame. |
| `GET` | `summary_stats(df)` | Returns KPI dictionary (totals, uniques, means). |
| `GET` | `top_species(df, n=10)` | Returns top-N species by count. |
| `DELETE`| `drop_unknowns(df)` | Removes rows with unresolved `TREES NAME`. |

**Request / response example**
```python
from Python.Data_Cleaning import load_data, clean_dataset

df = load_data("Dataset/raw data/A BLOCK (1).csv")
clean = clean_dataset(df)

# {'rows': 142, 'unique_species': 37, 'categories': 5}
```

---

## 🗄️ Database Schema

**Main table — `trees`**

| Column | Type | Description |
|---|---|---|
| `id` | INT PK | Surrogate key |
| `block` | VARCHAR(50) | Block / building identifier |
| `tree_name` | VARCHAR(120) | Common name |
| `scientific_name` | VARCHAR(120) | Botanical name |
| `count` | INT | Number of trees of that species in the block |
| `category` | ENUM | Fruit / Shade / Flowering / Medicinal / Ornamental |

**Dimension tables (optional star schema)**
- `blocks(block_id, block_name, area_sqm)`
- `categories(category_id, category_name, description)`

**Data flow**
Raw CSV → staging table → cleaning queries → `trees` fact table → BI views consumed by the dashboard.

---

## 🧪 Testing

```bash
# Unit tests
pytest tests/ -v

# Coverage
pytest --cov=Python tests/
```

- **Unit tests** cover cleaning helpers, schema validation, KPI math.
- **Integration tests** spin up a temp SQLite DB and run the SQL scripts end-to-end.
- **E2E tests** use `streamlit.testing.v1.AppTest` to verify the dashboard renders without errors for sample data.

Tooling: **pytest**, **pytest-cov**, **streamlit.testing**, **sqlfluff** for SQL linting.

---

## 🚀 Performance Optimizations

- **Caching** — `@st.cache_data` on data-loading functions to avoid re-reads.
- **Lazy Loading** — heavy notebooks load charts only when their tab is opened.
- **Pagination** — top-N truncation on species tables to keep payloads small.
- **Query Optimization** — indexes on `block` and `category` for SQL workloads.
- **Code Splitting** — analytics code separated from dashboard rendering code.
- **Compression** — Plotly figures rendered with `use_container_width` to avoid oversized SVGs.

---

## 🛡️ Security Features

- **Authentication** — optional Streamlit-Authenticator layer for admin views.
- **Authorization** — read-only public mode, write-enabled analyst mode.
- **Password Encryption** — bcrypt hashes for stored credentials.
- **JWT Security** — short-lived tokens when exposing an API layer.
- **Input Validation** — uploaded CSVs validated against an expected schema.
- **Rate Limiting** — Streamlit Cloud + reverse proxy rules for abuse protection.
- **CSRF Protection** — enabled on any embedded Flask/FastAPI side-services.
- **Secure API Practices** — parameterised SQL, env-driven secrets, no creds in VCS.

---

## ☁️ Deployment

**Streamlit Community Cloud (recommended)**
1. Push the repo to GitHub.
2. Connect the repo on share.streamlit.io.
3. Set `Python/Dashboard.py` as the entry point.

**Other targets**
- **Vercel** — via a Python serverless adapter for static export of notebook charts.
- **Netlify** — host the documentation site only.
- **Render / Railway** — one-click Python web service using `streamlit run Python/Dashboard.py --server.port $PORT`.
- **AWS** — EC2 / ECS with an Application Load Balancer; S3 for raw CSV storage.
- **Azure** — App Service for Python with continuous deployment from GitHub.

**CI/CD overview**
GitHub Actions → lint (black, flake8, sqlfluff) → pytest → build Docker image → deploy to the chosen host on `main` merges.

---

## 🧩 Challenges & Solutions

- **Inconsistent raw data.** Block CSVs were collected by different volunteers — spellings like *"Coconut"*, *"COCONUT "*, *"cocnut"* all appeared. Solved with a normalisation dictionary and fuzzy matching using `rapidfuzz`.
- **Unknown scientific names.** Many entries had `UNKNOWN` as the scientific name. Built a lookup table mapping common → botanical names and back-filled programmatically.
- **Category ambiguity.** A "Mango" tree is both *Fruit* and *Shade*. Resolved by picking the primary category and adding a future-scope `tags` column.
- **Excel vs CSV drift.** Raw uploads existed in both `.xlsx` and `.csv` formats with subtly different columns. Standardised on CSV in the cleaning step and archived `.xlsx` for traceability.
- **Streamlit re-runs.** Naïve implementations re-read large CSVs on every interaction. Solved with `st.cache_data` and a fingerprint-based invalidation strategy.
- **SQL/Python parity.** Keeping the SQL and Python pipelines logically identical required a shared rules document and golden-output regression tests.

---

## 🔮 Future Improvements

1. **GeoJSON campus map** with tree pins via Folium / Mapbox.
2. **Carbon-sequestration estimator** per species using IPCC factors.
3. **Image upload + ML species identification** with a fine-tuned ResNet.
4. **Time-series tracking** of new plantations and removals.
5. **Admin authentication** with role-based access.
6. **REST API** (FastAPI) exposing the cleaned dataset.
7. **PDF report generator** for one-click NAAC / ESG submissions.
8. **Mobile-first PWA companion** for in-field data collection.
9. **Multi-campus support** with tenant isolation.
10. **Anomaly detection** — flag block counts that deviate from historical norms.
11. **Bilingual UI** (English + regional language).
12. **LLM-powered insights tab** — natural-language Q&A over the dataset.

---

## 🤝 Contributing

Contributions are welcome and appreciated.

1. **Fork** the repository.
2. **Create a feature branch:** `git checkout -b feature/amazing-feature`.
3. **Commit your changes:** `git commit -m "feat: add amazing feature"`.
4. **Push the branch:** `git push origin feature/amazing-feature`.
5. **Open a Pull Request** with a clear description and screenshots where relevant.

**Coding standards**
- Format Python with **black**, lint with **flake8**.
- Use **conventional commits** (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`).
- Add or update tests for every behavioural change.
- Keep notebooks tidy — clear outputs before committing.

---

## ❓ FAQ

**Q: Do I need a database to run this?**
A: No. The dashboard works directly off `Cleaned_Data.csv`. The SQL scripts are optional.

**Q: Can I use my own institution's data?**
A: Yes — match the column schema (`BLOCK, TREES NAME, SCIENTIFIC NAME, COUNT, CATEGORY`) and upload through the sidebar.

**Q: Why both Python and SQL pipelines?**
A: To make the project useful to both data-analyst and data-engineer audiences, and to demonstrate parity between the two paradigms.

**Q: Is the data accurate?**
A: It reflects a one-time campus survey. Treat it as a snapshot, not a continuously-updated source.

**Q: Can I deploy this on Streamlit Cloud for free?**
A: Yes — the project is small enough to fit comfortably within free-tier limits.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---
## 👤 Author

**HARI BABU C H**

Frontend Developer | Data Analyst | Chennai, India

- 🌐 Portfolio: [https://www.haribabu.me](https://www.haribabu.me)
- 💼 LinkedIn: [https://www.linkedin.com/in/haribabux8](https://www.linkedin.com/in/haribabux8)
- 🐙 GitHub: [https://github.com/haribabux8](https://github.com/haribabux8)
- 📧 Email: [haribabuc458@gmail.com](mailto:haribabuc458@gmail.com)

---

## 🙏 Acknowledgements

- **Open-source libraries:** Streamlit, Pandas, NumPy, Plotly, Matplotlib, Seaborn, OpenPyXL.
- **Contributors:** every student volunteer who walked a block and counted trees.
- **Learning resources:** Streamlit docs, Kaggle EDA notebooks, Mode SQL tutorials, "Python for Data Analysis" by Wes McKinney.
- **Inspiration:** the quiet ecosystems hiding in plain sight on every campus.

---

