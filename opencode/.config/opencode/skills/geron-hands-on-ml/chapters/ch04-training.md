# Chapter 4: Training Models

## Core Idea
Understanding the underlying math and optimization algorithms of ML models allows for better model selection, hyperparameter tuning, and error analysis. This chapter dives "under the hood" of linear and logistic regression.

## Frameworks Introduced
- **Linear Regression**:
  - **Normal Equation**: Closed-form solution to find optimal parameters: $\hat{\theta} = (X^T X)^{-1} X^T y$.
  - **SVD (Singular Value Decomposition)**: The standard approach in Scikit-Learn's `LinearRegression`, more stable than the Normal Equation.
- **Gradient Descent (GD)**: Iterative optimization to minimize a cost function.
  - **Batch GD**: Uses the full training set at every step (slow for large data).
  - **Stochastic GD (SGD)**: Uses a single random instance at each step (fast, supports out-of-core).
  - **Mini-batch GD**: Uses small random subsets (balances speed and stability).
- **Regularized Linear Models**:
  - **Ridge Regression ($L_2$)**: Adds $\alpha \sum \theta_i^2$ to the cost function; keeps weights small.
  - **Lasso Regression ($L_1$)**: Adds $\alpha \sum |\theta_i|$; tends to produce sparse models (feature selection).
  - **Elastic Net**: Weighted mix of Ridge and Lasso.

## Key Concepts
- **MSE (Mean Squared Error)**: Standard convex cost function for linear regression.
- **Learning Rate ($\eta$)**: Size of the steps in Gradient Descent.
- **Learning Schedule**: Strategy for reducing the learning rate during training (e.g., simulated annealing).
- **Polynomial Regression**: Adding powers of features to fit nonlinear data.
- **Learning Curves**: Plots of training/validation error vs. training set size; used to detect overfitting (gap between curves) or underfitting (both curves high).
- **Bias/Variance Trade-off**:
  - **Bias**: Error from wrong assumptions (leads to underfitting).
  - **Variance**: Error from excessive sensitivity to noise (leads to overfitting).
- **Early Stopping**: Stopping training as soon as the validation error reaches a minimum.

## Techniques
- **Logistic Regression**: Used for binary classification; uses the sigmoid function to output probabilities.
- **Softmax Regression**: Generalization of Logistic Regression for multiclass classification.

## Anti-patterns
- **Ignoring Feature Scaling**: Gradient Descent takes much longer to converge if features have different scales.
- **Overusing High-Degree Polynomials**: Leads to severe overfitting. Use regularization instead.

## Connects To
- **Ch 11**: Deep Learning optimizers (Adam, RMSProp) are advanced variants of Gradient Descent.
- **Ch 10**: Logistic Regression is the foundation of individual neurons in ANNs.
