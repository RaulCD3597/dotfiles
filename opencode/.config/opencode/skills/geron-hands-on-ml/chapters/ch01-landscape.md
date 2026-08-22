# Chapter 1: The Machine Learning Landscape

## Core Idea
Machine Learning is the science of programming computers so they can learn from data and improve their performance on a specific task over time without being explicitly programmed.

## Frameworks Introduced
- **Supervised Learning**: The training set includes the desired solutions (labels).
  - When to use: Classification (spam/ham) and Regression (predicting car prices).
- **Unsupervised Learning**: The training data is unlabeled; the system learns without a teacher.
  - When to use: Clustering, Visualization, Dimensionality Reduction, Anomaly Detection.
- **Semi-supervised Learning**: Deals with data that is partially labeled (e.g., Google Photos).
- **Self-supervised Learning**: Generates a fully labeled dataset from a fully unlabeled one (e.g., masking parts of an image).
- **Reinforcement Learning**: An agent observes the environment, selects actions, and gets rewards/penalties to learn a policy.
- **Batch vs. Online Learning**:
  - Batch: Trained offline using all available data; must be retrained from scratch to update.
  - Online: Trained incrementally by feeding data instances sequentially; useful for fast-changing data or huge datasets (out-of-core).
- **Instance-based vs. Model-based Learning**:
  - Instance-based: Learns by heart and generalizes using a similarity measure.
  - Model-based: Builds a model of examples and uses it for predictions (e.g., Linear Regression).

## Key Concepts
- **Training Set**: The examples the system uses to learn.
- **Model**: The part of a machine learning system that learns and makes predictions.
- **Overfitting**: The model performs well on training data but does not generalize well to new data (model is too complex).
- **Underfitting**: The model is too simple to learn the underlying structure of the data.
- **Regularization**: Constraining a model to make it simpler and reduce the risk of overfitting.
- **Hyperparameter**: A parameter of a learning algorithm (not the model) that must be set prior to training.
- **Feature Engineering**: Selecting, extracting, and creating useful features for training.

## Mental Models
- **Think of ML as Data Mining**: Use models to reveal unsuspected correlations or trends in large amounts of data.
- **Use Online Learning for Out-of-Core**: When a dataset is too large for a single machine's memory, use incremental learning to process it in chunks.

## Anti-patterns
- **Insufficient Training Data**: Attempting complex tasks (like image recognition) with too few samples.
- **Nonrepresentative Training Data**: Using a biased sample (sampling bias) that doesn't reflect the target population.
- **Poor-Quality Data**: Training on data full of errors, outliers, and noise without cleaning it first.
- **Irrelevant Features**: Including "garbage" features that don't contribute to the prediction.

## Key Takeaways
1. ML is great for complex problems with no known traditional algorithm or fluctuating environments.
2. Always clean your data: discard outliers and handle missing features before training.
3. Balance model complexity: use regularization to find the sweet spot between overfitting and underfitting.
4. Generalization is the goal: performing well on new, unseen instances is what matters most.

## Connects To
- **Ch 2**: End-to-end project workflow implementation.
- **Ch 4**: Deeper dive into Linear Regression and Training Models.
- **Ch 9**: Detailed techniques for Unsupervised Learning.
