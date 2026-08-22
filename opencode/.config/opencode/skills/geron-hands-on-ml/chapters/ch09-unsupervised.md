# Chapter 9: Unsupervised Learning Techniques

## Core Idea
Leveraging unlabeled data for grouping (clustering), identifying outliers (anomaly detection), and understanding data distributions (density estimation).

## Frameworks Introduced
- **k-means**: Groups instances into $k$ clusters by minimizing the distance to centroids.
  - **k-means++**: Smart initialization algorithm to avoid suboptimal local optima (default).
  - **Mini-batch k-means**: Faster version for large datasets.
- **DBSCAN**: Defines clusters as continuous regions of high density. Robust to outliers and can find any shape.
- **Gaussian Mixture Models (GMM)**: Probabilistic model assuming instances are generated from multiple Gaussian distributions. Excellent for ellipsoidal clusters.

## Key Concepts
- **Inertia**: Sum of squared distances to the nearest centroid. Not good for choosing $k$ (always decreases).
- **Elbow Rule**: Choosing $k$ where the inertia decrease slows down.
- **Silhouette Score**: Mean silhouette coefficient across instances; $+1 \to$ well inside cluster, $0 \to$ near boundary, $-1 \to$ wrong cluster.
- **Voronoi Tessellation**: The decision boundaries produced by k-means.
- **Anomaly Detection**: Identifying instances that deviate significantly from the "normal" data (e.g., low density in a GMM).

## Techniques
- **Image Segmentation**: Using k-means for color quantization (replacing pixel colors with cluster means).
- **Semi-supervised Learning**:
  - **Label Propagation**: Clustering data, labeling representative images, and propagating those labels to the whole cluster.
  - **Active Learning**: A human expert labels the instances the model is most uncertain about.
- **Choosing $k$ in GMM**: Use BIC (Bayesian Information Criterion) or AIC (Akaike Information Criterion) to find the simplest model that fits the data well.

## Anti-patterns
- **k-means on Varying Densities**: k-means performs poorly if clusters have different sizes or nonspherical shapes. Use GMM or DBSCAN instead.
- **Running k-means without Scaling**: Centroid distances will be dominated by large-scale features.

## Key Takeaways
1. Unsupervised learning is "the cake"—the vast majority of data is unlabeled.
2. k-means is fast and scalable but assumes spherical clusters.
3. GMM provides a probabilistic framework for both clustering and anomaly detection.

## Connects To
- **Ch 2**: Used k-means to add geographic similarity features.
- **Ch 17**: Autoencoders and GANs are advanced unsupervised generative models.
