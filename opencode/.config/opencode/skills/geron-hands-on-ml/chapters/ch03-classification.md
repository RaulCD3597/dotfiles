# Chapter 3: Classification

## Core Idea
Classification is about predicting discrete classes. This chapter uses the MNIST dataset (handwritten digits) to explore binary and multiclass classification, emphasizing the importance of choosing the right evaluation metrics for skewed datasets.

## Frameworks Introduced
- **Binary Classification**: Distinguishing between two classes (e.g., "5" vs. "not-5").
- **Multiclass Classification**: Distinguishing between more than two classes.
  - **One-versus-the-Rest (OvR)**: Train one binary classifier per class.
  - **One-versus-One (OvO)**: Train a binary classifier for every pair of classes.
- **Multilabel Classification**: Assigning multiple labels to a single instance (e.g., face recognition).
- **Multioutput Classification**: A generalization where each label can be multiclass (e.g., image denoising).

## Key Concepts
- **Confusion Matrix**: A table counting true/false positives and negatives.
- **Precision**: Accuracy of positive predictions: $TP / (TP + FP)$.
- **Recall (Sensitivity)**: Ratio of positive instances correctly detected: $TP / (TP + FN)$.
- **F1 Score**: Harmonic mean of precision and recall; favors models with similar values.
- **Precision/Recall Trade-off**: Increasing one typically decreases the other. Controlled by the decision threshold.
- **ROC Curve**: Plots True Positive Rate (Recall) vs. False Positive Rate (1 - Specificity).
- **AUC (Area Under the Curve)**: Metric for comparing classifiers; 1.0 is perfect, 0.5 is random.

## Techniques
- **Threshold Tuning**: Using `decision_function()` to manually set the threshold for specific precision/recall targets.
- **Cross-validation for Classification**: Using `cross_val_predict()` to get clean predictions for confusion matrices.
- **Error Analysis**: Normalizing confusion matrices and plotting misclassified instances to identify model weaknesses.
- **Data Augmentation**: Expanding the training set by shifting or rotating images to improve robustness.

## Anti-patterns
- **Using Accuracy for Skewed Data**: A dummy classifier can get 90% accuracy on a dataset where 10% are positive. Use Precision/Recall instead.
- **Looking at the ROC AUC only**: The ROC curve can be misleadingly optimistic when the positive class is rare. Use the Precision/Recall (PR) curve instead.

## Connects To
- **Ch 4**: Logistic Regression, which is a common classification algorithm.
- **Ch 5**: SVMs for high-dimensional classification.
- **Ch 14**: CNNs for state-of-the-art image classification.
