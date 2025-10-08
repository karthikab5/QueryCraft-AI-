import streamlit as st
from data_base import db_chain
@st.cache_resource
def get_chain():
    return db_chain()  #  function for SQLDatabaseChain

st.header('Query Assistant')

with st.form("ask"):
    question = st.text_input("Question:")
    go = st.form_submit_button("Run")

if go and question:
    try:
        chain = get_chain()
        res = chain.run(question)
        st.subheader("Answer")
        st.write(res)
    except Exception as e:
        st.error(f"{type(e).__name__}: {e}")
