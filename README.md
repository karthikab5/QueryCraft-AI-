# QueryCraft-AI- Natural Language → SQL for MySQL (Streamlit + LangChain + Gemini)

Ask business questions in plain English and get answers from your **MySQL** database — no SQL required.  
Powered by **LangChain’s SQLDatabaseChain**, **Google Gemini 2.5 Flash**, semantic **few-shot prompting** (Chroma + HuggingFace), and a clean **Streamlit** UI.

---

## ✨ Features

- 🧠 **LLM → SQL**: Converts your question to safe, schema-aware MySQL (avoids `SELECT *`, uses backticks for columns)
- 🗃️ **Real database**: Connects via SQLAlchemy URL (`mysql+pymysql://...`)
- 🧩 **Few-shot guidance**: Embeddings + Chroma pick the best examples to steer SQL generation
- 📅 **Date-aware**: Uses `CURDATE()` for “today” queries
- 🖥️ **Streamlit app**: Caches the chain for fast, stable re-runs

---

## 🖼️ Screenshots

> Add your images to the repo under `./screenshots/` and update file names below.

![App — Home](screenshots/app-home.png)

![App — Answer Example](screenshots/answer-example.png)

---

## 🧰 Tech Stack

- **Frontend / App**: Streamlit  
- **LLM Orchestration**: LangChain (`SQLDatabaseChain`)  
- **LLM**: Google Gemini 2.5 Flash (`langchain_google_genai`)  
- **Semantic Selector**: HuggingFace embeddings + Chroma  
- **Database**: MySQL (SQLAlchemy + PyMySQL)

---

## 📦 Project Structure
├── main.py # Streamlit UI (input form, run, display)
├── data_base.py # DB connection, embeddings/Chroma, few-shot selector, SQL chain
├── few_shot.py # Example Q/A/SQL triples used for few-shot prompting

## 🧪 Usage

- Ask questions like:

   “How many t-shirts do we have left for Nike, size XS, color white?”

   “Total sales if we sell all L size Nike today after discounts — return only the number.”

   “Top 5 brands by inventory count.”

   What happens under the hood

   Your question is matched with the closest few-shots (from few_shot.py) using embeddings.The model generates schema-aware SQL (no non-existent columns; backticks enforced).
   SQL runs against MySQL; the app shows a concise answer.

## 🧱 Schema Assumptions (example)

   Adjust to your dataset. A common pattern this app supports:

   t_shirts(t_shirt_id, brand, color, size, price, stock_quantity, …)

   discounts(t_shirt_id, pct_discount, start_date, end_date)

   To compute “revenue after discounts for brand/size today,” a typical query looks like:
   
   SELECT
   COALESCE(ROUND(SUM( (t.price * (1 - COALESCE(d.pct_discount,0)/100.0)) * t.stock_quantity ), 2), 0) AS revenue_today
   FROM t_shirts t
   LEFT JOIN discounts d
   ON d.t_shirt_id = t.t_shirt_id
   AND CURDATE() BETWEEN d.start_date AND d.end_date
   WHERE t.brand = 'Nike' AND t.size = 'L';
## 🧠 Prompting Strategy

  The base prompt instructs the model to:

  Avoid SELECT *; select only required columns

  Wrap column names in backticks (`column`)

  Use CURDATE() for “today” filters

  Prefer LEFT JOIN when applying discounts and treat missing discounts as 0 via COALESCE

  Follow a strict output format:
   Question: ...
   SQLQuery: ...
   SQLResult: ...
   Answer: ...
## 🛠️ Troubleshooting

  App “collapses” after one run
  Don’t assign to Streamlit functions (e.g., st.header = "..."). Always call them: st.header("...").
  Use @st.cache_resource to cache the chain so re-runs are stable.

  Ambiguous/complex queries
  Add a matching few-shot for the exact pattern (e.g., brand+size+discount join).
  Consider enabling use_query_checker=True and return_intermediate_steps=True when building SQLDatabaseChain.

  MySQL connection errors
  Verify credentials, host/port, and that the DB exists.
  Confirm the driver is installed (pymysql, sqlalchemy) and the URL is correct.

  No Google API access
  Make sure GOOGLE_API_KEY is set and langchain_google_genai is installed.
## 🗺️ Roadmap

  Query checker + intermediate steps for explainability

  “Show SQL” toggle + CSV export

  Optional demo dataset for public testing

  Dockerfile for easy deployment 

  
  

