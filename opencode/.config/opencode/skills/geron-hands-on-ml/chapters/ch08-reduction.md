# Chapter 8: Dimensionality Reduction

## Core Idea
Fighting the "Curse of Dimensionality": reducing the number of features to speed up training, save memory, and enable data visualization, while preserving as much information as possible.

## Frameworks Introduced
- **Projection**: Projecting data onto a lower-dimensional hyperplane (e.g., PCA).
- **Manifold Learning**: Modeling the manifold (a d-dimensional shape bent in n-dimensional space) on which the data lies (e.g., LLE, t-SNE).
- **PCA (Principal Component Analysis)**:
  - Finds the axis that preserves the maximum variance.
  - Uses SVD (Singular Value Decomposition) under the hood.
- **Random Projection**: Using random linear projections to project data; surprisingly effective at preserving distances (Johnson-Lindenstrauss Lemma).
- **LLE (Locally Linear Embedding)**: Nonlinear technique that measures local relationships between neighbors and tries to preserve them in low dimensions (good for unrolling "Swiss rolls").

## Key Concepts
- **Curse of Dimensionality**: High-dimensional space is mostly empty; instances are far apart, leading to severe overfitting and unreliable predictions.
- **Principal Components (PCs)**: Orthogonal axes that account for the largest amounts of remaining variance.
- **Explained Variance Ratio**: The proportion of the dataset’s variance that lies along each PC.
- **Reconstruction Error**: The distance between the original data and its compressed-then-decompressed version.

## Techniques
- **Choosing $d$**: Set `n_components` to a float (e.g., `0.95`) to preserve a specific ratio of variance.
- **Incremental PCA (IPCA)**: Splitting the dataset into mini-batches for large data or online use.
- **t-SNE (t-distributed Stochastic Neighbor Embedding)**: Excellent for visualization; keeps similar instances close and dissimilar ones apart.
- **LDA (Linear Discriminant Analysis)**: A supervised technique that finds the most discriminative axes between classes.

## Anti-patterns
- **Using PCA for Overfitting**: Try regularization first. PCA is a "destructive" regularization and might lose useful signal.
- **Using LLE on Huge Datasets**: It has $O(dm^2)$ complexity for constructing representations, which doesn't scale. Use Random Projection or PCA instead.

## Key Takeaways
1. Always try training on original data first.
2. PCA assumes the dataset is centered (Keras/Scikit-Learn handle this).
3. Dimensionality reduction is critical for visualizing high-dimensional clusters.

## Connects To
- **Ch 17**: Autoencoders, which are a deep learning approach to nonlinear dimensionality reduction.
- **Ch 13**: Embedding layers, which learn low-dimensional representations for categorical data.
