# Chapter 16: Natural Language Processing with RNNs and Attention

## Core Idea
From character-level text generation to high-level machine translation and modern Transformers. This chapter covers how deep learning "understands" and generates human language.

## Frameworks Introduced
- **Char-RNN**: Predicting the next character in a sequence (e.g., Shakespeare generator).
- **Stateful RNN**: Preserving the hidden state between training batches to learn very long-term patterns.
- **Sentiment Analysis**: Word-level classification (IMDb reviews).
- **Neural Machine Translation (NMT)**: Encoder-Decoder architecture for translating English to Spanish.
- **Attention Mechanisms**: Components that allow the model to "focus" on specific parts of the input at each step.
- **The Transformer**: An attention-only architecture (no RNNs) that revolutionized NLP.
  - **Self-Attention**: Relates different positions of a single sequence.
  - **Multi-Head Attention**: Runs multiple attention layers in parallel to capture different aspects of the text.

## Key Concepts
- **Tokenization**: Chopping text into characters, words, or subwords (BPE, SentencePiece).
- **Word Embeddings**: Dense vector representations of words where distance corresponds to semantic similarity.
- **Masking**: Telling the model to ignore padding tokens so they don't corrupt the "memory".
- **Teacher Forcing**: During training, feeding the decoder the *actual* target word from the previous step instead of its own (possibly wrong) prediction.
- **Beam Search**: A decoding strategy that keeps track of the $k$ most promising sentences instead of just picking the single best word at each step.

## Techniques
- **Stateful RNN Training**: Requires batches where each sequence continues the one from the previous batch.
- **Universal Sentence Encoder**: Reusing a pretrained model from TensorFlow Hub for high-performance classification with little data.
- **Hugging Face Transformers**: The industry-standard library for accessing models like BERT, GPT-2, and T5.

## Anti-patterns
- **Using RNNs for Everything**: Transformers are generally faster and better for long-range dependencies in NLP.
- **Ignoring Subword Tokenization**: Simple word-level tokenization cannot handle rare or misspelled words.

## Key Takeaways
1. "Attention is all you need": The Transformer dropped recurrence in favor of parallelizable attention.
2. Pretrained language models (BERT, GPT) are the new foundation for almost all NLP tasks.
3. Masking is critical when dealing with variable-length sequences in Keras.

## Connects To
- **Ch 13**: `TextVectorization` and `Embedding` layers.
- **Ch 15**: Recurrent architectures.
