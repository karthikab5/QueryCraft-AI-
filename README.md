# 🧠 **QueryCraft-AI**  
### *Natural Language → SQL for MySQL (Streamlit + LangChain + Gemini)*  

Ask business questions in plain English and get instant answers from your **MySQL** database — no SQL required.  
Built with **LangChain’s SQLDatabaseChain**, **Google Gemini 2.5 Flash**, **semantic few-shot prompting** (Chroma + HuggingFace), and a clean **Streamlit UI**.

---

## ✨ **Key Features**

- 🧠 **LLM → SQL Conversion**  
  Converts your natural-language questions into **safe, schema-aware MySQL queries** — avoids `SELECT *`, uses backticks, and respects table structure.

- 🗃️ **Real Database Connectivity**  
  Connects directly to MySQL using **SQLAlchemy** with full CRUD guardrails.  
  `mysql+pymysql://username:password@localhost:3306/database_name`

- 🧩 **Few-Shot Semantic Guidance**  
  Embeddings (HuggingFace + Chroma) select the most relevant Q/A examples to guide SQL generation.

- 📅 **Date-Aware Reasoning**  
  Automatically interprets “today,” “this week,” or “last month” using `CURDATE()` and SQL functions.

- ⚡ **Streamlit UI + Caching**  
  Smooth, stable interaction via `@st.cache_resource` — optimized for repeated queries.

---

## 🖥️ **Screenshots**

> Add your images to the repo under `./screenshots/` and update file names below.

<img width="1909" height="811" alt="image" src="https://github.com/user-attachments/assets/fb86e6c4-24df-4493-b457-61415ca7bc26" />

<img width="1894" height="810" alt="image" src="https://github.com/user-attachments/assets/90051267-f204-4ef3-9db1-b154252c140a" />

<img width="1856" height="899" alt="image" src="https://github.com/user-attachments/assets/bd37ee2b-229d-45c7-a04a-1035f9ff03dd" />

<img width="1843" height="955" alt="image" src="https://github.com/user-attachments/assets/ffaeecf5-0143-4bb2-96f8-ef263389d461" />



---

## 🧰 **Tech Stack**

| Layer | Tools |
|-------|-------|
| 🖥️ Frontend / App | Streamlit |
| 🧠 LLM Orchestration | LangChain (`SQLDatabaseChain`) |
| 💬 Model | Google Gemini 2.5 Flash (`langchain_google_genai`) |
| 🔍 Semantic Selector | HuggingFace Embeddings + Chroma |
| 🗃️ Database | MySQL (SQLAlchemy + PyMySQL) |

---

## 🗂️ **Project Structure**
├── main.py # Streamlit UI (input, execution, display)
├── data_base.py # MySQL connection, embeddings, few-shot selector, SQL chain
├── few_shot.py # Example Q/A/SQL triplets for semantic prompting
├── .env # API keys and DB credentials (excluded from repo)
└── screenshots/ # UI screenshots for README

---

## 🧪 **Usage**

Ask questions like:

- “How many t-shirts do we have left for Nike, size XS, color white?”  
- “Total sales if we sell all L size Nike today after discounts — return only the number.”  
- “Top 5 brands by inventory count.”

**Behind the scenes:**
1. Your question is embedded → compared with few-shots → best example selected.  
2. Gemini generates schema-aware SQL with backticks and joins.  
3. SQL executes via MySQL connection → results shown instantly in Streamlit.  

---


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
---

⚙️ Troubleshooting
| Issue                                 | Fix                                                                                        |
| ------------------------------------- | ------------------------------------------------------------------------------------------ |
| Streamlit app collapses after one run | Don’t assign functions (e.g., `st.header = "..."`), always *call* them: `st.header("...")` |
| Re-runs too slow                      | Use `@st.cache_resource` for chain caching                                                 |
| Ambiguous queries                     | Add custom few-shots to `few_shot.py`                                                      |
| MySQL connection error                | Check credentials, driver (`pymysql`), and database URL                                    |
| No Google API access                  | Ensure `GOOGLE_API_KEY` is set and `langchain_google_genai` installed                      |

---

## 🗺️ Roadmap

✅ Query checker + explainability with return_intermediate_steps=True

✅ “Show SQL” toggle + CSV export

🧩 Demo dataset for quick testing

🐳 Dockerfile for easy deployment

 ---
## 🔭 Future Scope: MCP, UTCP & AgentKit Integration

⚡ 1. Model Context Protocol (MCP)

Goal: Make QueryCraft-AI portable across LLM ecosystems by exposing standardized tools like:

get_schema() → returns metadata

run_sql(query) → executes read-only SQL safely

discounted_revenue(brand, size, date) → predefined helper

✅ Deliverables

/mcp/ package

Auth, audit logging, and rate-limit docs

⚡ 2. Universal Tool Calling Protocol (UTCP)

Goal: Direct low-latency calls to analytics endpoints (/sql/run, /metrics/revenue_today) without wrapper servers.

✅ Deliverables

/utcp/manifest.json

Benchmarks for MCP vs UTCP performance

⚡ 3. OpenAI Apps + AgentKit Integration

Goal: Bring QueryCraft-AI inside ChatGPT with Apps SDK and AgentKit — no local install needed.

Guided flow: “Question → SQL Plan → Execution → Answer”

Built-in guardrails, UI panel, and CSV export

AgentKit for step-by-step validation and evals

✅ Deliverables

/apps/ folder

App logs, evals, and “Show SQL” toggle

---

## ⚡ 4. Security & Compliance

Read-only DB roles & parameterized queries

Query timeouts and rate limiting

Log sanitization & PII scrubbing

Key rotation & explicit consent for data retention


  
  

