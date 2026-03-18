## Vector DB Use Case

A traditional keyword-based database search would not suffice for a law firm wanting to search 500-page contracts in plain English. Here is why, and what role a vector database would play.

Keyword search works by matching exact words or phrases. If a lawyer types "What are the termination clauses?", a keyword search would look for documents containing the words "termination" and "clauses" literally. This creates two major problems. First, the contract might use synonymous language — phrases like "contract dissolution conditions", "exit provisions", or "grounds for ending the agreement" — which a keyword search would completely miss. Second, keyword search has no understanding of meaning or context. It cannot distinguish between a termination clause in an employment contract versus a software licensing agreement, even if both contain the same words.

A vector database solves this by representing text as high-dimensional numerical vectors — called embeddings — that capture semantic meaning. When the lawyer asks "What are the termination clauses?", the question is converted into an embedding vector using a language model. The system then searches for contract sections whose embeddings are mathematically closest to the question's embedding, using cosine similarity. This means it finds sections that mean the same thing, even if the exact words differ.

In practice, the law firm would pre-process all contracts by splitting them into chunks, generating embeddings for each chunk, and storing them in a vector database like Pinecone, Weaviate, or ChromaDB. At query time, the lawyer's plain English question is embedded and matched against stored vectors, returning the most semantically relevant contract sections instantly — regardless of the exact wording used in the original document.

This makes vector databases far superior to keyword search for legal document retrieval, where precise language varies widely across contracts and jurisdictions.
