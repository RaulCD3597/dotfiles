---
name: geron-hands-on-ml
description: "Knowledge base from \"Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow\" by Aurélien Géron. Use when applying Scikit-Learn/TensorFlow frameworks for regression, classification, deep learning, NLP, computer vision, and RL."
allowed-tools:
  - Read
  - Grep
argument-hint: [topic, framework name, or chapter number]
---

# Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow
**Author**: Aurélien Géron | **Generated**: 2026-06-12

## How to Use This Skill

- **Without arguments** — load core frameworks and design patterns for reference.
- **With a topic** — ask about `regularization`, `transformers`, or `DQN`; I find and read the relevant chapter.
- **With chapter** — ask for `ch14` for computer vision or `ch18` for reinforcement learning.
- **Browse** — ask "what chapters do you have?" to see the full index.

When you ask about a topic not covered in Core Frameworks below, I will read the relevant chapter file before answering.

---

## Core Frameworks & Mental Models

### 1. The Machine Learning Project Lifecycle (Ch 2)
- **Mental Model**: ML is an iterative process. Start by framing the problem (regression vs classification), selecting a performance measure (RMSE vs F1), and automating the data pipeline.
- **Key Technique**: Use **Stratified Sampling** to ensure your test set is representative of the whole population.

### 2. Linear & Logistic Foundations (Ch 4)
- **Use X when Y**: Use **Ridge Regression** for general regularization, **Lasso** if you want automatic feature selection (sparse models).
- **Optimizer**: Default to **Adam** for deep learning, but master **Stochastic Gradient Descent (SGD)** for large-scale linear problems.

### 3. The Power of Ensembles (Ch 7)
- **Think of X as Y**: Think of a **Random Forest** as a "Wisdom of the Crowd" for Decision Trees.
- **Pattern**: Combine multiple weak learners into a strong learner using **Boosting** (AdaBoost, Gradient Boosting, XGBoost).

### 4. Deep Learning Workflow (Ch 10, 11)
- **Rule of Thumb**: Use **He Initialization** with **ReLU** (or Swish) activation.
- **Regularization**: Always use **Early Stopping**. Use **Batch Normalization** to stabilize training and **Dropout** to prevent overfitting.
- **Transfer Learning**: Never train a large vision or NLP model from scratch if a pretrained one is available.

### 5. Modern NLP & Attention (Ch 16)
- **Mental Model**: Recurrence (RNNs) is being replaced by **Attention** (Transformers).
- **Pattern**: Use **Hugging Face Transformers** for state-of-the-art language tasks.

---

## Chapter Index

| # | Title | Key Frameworks |
|---|-------|----------------|
| [ch01](chapters/ch01-landscape.md) | ML Landscape | Supervised, Unsupervised, Online, Batch |
| [ch02](chapters/ch02-project.md) | End-to-End Project | Pipelines, RMSE, Stratified Sampling |
| [ch03](chapters/ch03-classification.md) | Classification | Confusion Matrix, Precision, Recall, ROC |
| [ch04](chapters/ch04-training.md) | Training Models | Gradient Descent, Regularization, Logistic |
| [ch05](chapters/ch05-svm.md) | Support Vector Machines | Kernel Trick, Large Margin, RBF |
| [ch06](chapters/ch06-trees.md) | Decision Trees | CART, Gini, Entropy, Feature Importance |
| [ch07](chapters/ch07-ensembles.md) | Ensembles | Random Forests, Bagging, Boosting, Stacking |
| [ch08](chapters/ch08-reduction.md) | Dimensionality Reduction | PCA, SVD, t-SNE, LLE |
| [ch09](chapters/ch09-unsupervised.md) | Unsupervised | k-means, DBSCAN, GMM, Anomaly Detection |
| [ch10](chapters/ch10-keras.md) | Intro to ANNs | Keras Sequential, MLP, Backprop |
| [ch11](chapters/ch11-deep-training.md) | Deep Training | BN, Dropout, He Init, Faster Optimizers |
| [ch12](chapters/ch12-custom.md) | Custom Models | GradientTape, Custom Layers/Losses |
| [ch13](chapters/ch13-data.md) | Data Loading | tf.data, TFRecord, Preprocessing Layers |
| [ch14](chapters/ch14-cnn.md) | Computer Vision | CNNs, Pooling, ResNet, Transfer Learning |
| [ch15](chapters/ch15-rnn.md) | Sequence Processing | RNN, LSTM, GRU, 1D CNN |
| [ch16](chapters/ch16-nlp.md) | NLP & Attention | Transformers, Self-Attention, BERT, GPT |
| [ch17](chapters/ch17-generative.md) | Generative | Autoencoders, GANs, Diffusion |
| [ch18](chapters/ch18-rl.md) | Reinforcement Learning | PG, Q-Learning, DQN, OpenAI Gym |
| [ch19](chapters/ch19-deploy.md) | Scale & Deploy | TF Serving, Vertex AI, TFLite, GPUs |

## Topic Index

- **Adversarial Training** → ch17
- **Anomaly Detection** → ch09, ch17
- **Attention Mechanism** → ch16
- **Backpropagation** → ch10
- **Batch Normalization** → ch11
- **Clustering** → ch09
- **CNNs** → ch14
- **Curse of Dimensionality** → ch08
- **Data Augmentation** → ch14
- **DQN** → ch18
- **Dropout** → ch11
- **Early Stopping** → ch04, ch11
- **Embeddings** → ch13, ch16
- **Feature Importance** → ch07
- **GANs** → ch17
- **Gradient Descent** → ch04
- **Kernel Trick** → ch05
- **LSTMs / GRUs** → ch15
- **Masking** → ch16
- **Overfitting** → ch01, ch04, ch11
- **PCA** → ch08
- **Precision / Recall** → ch03
- **Regularization** → ch04, ch11
- **SavedModel** → ch19
- **Self-Attention** → ch16
- **Softmax** → ch04, ch10
- **Transfer Learning** → ch11, ch14
- **Transformers** → ch16

## Supporting Files

- [glossary.md](glossary.md) — all key terms with definitions
- [patterns.md](patterns.md) — all techniques and design patterns
- [cheatsheet.md](cheatsheet.md) — quick reference tables and decision guides

---

## Scope & Limits

This skill covers the book content only. For hands-on implementation in your codebase, combine with project-specific tools. For topics beyond this book, check related skills or ask the agent directly.
