# Chapter 5: Support Vector Machines

## Core Idea
Support Vector Machines (SVMs) are powerful models that attempt to fit the "widest possible street" (large margin) between classes. They are particularly effective for complex, small-to-medium datasets.

## Frameworks Introduced
- **Linear SVM Classification**:
  - **Hard Margin**: Strictly imposes that all instances are on the correct side (sensitive to outliers).
  - **Soft Margin**: Balances margin width and margin violations (controlled by hyperparameter $C$).
- **Nonlinear SVM Classification**:
  - **Polynomial Features**: Adding $x^2, x^3$ etc. to make data linearly separable.
  - **Kernel Trick**: Mathematical "magic" that achieves the effect of high-degree polynomial features without actually adding them (via `SVC(kernel="poly")`).
  - **Gaussian RBF Kernel**: Adds similarity features for every instance (via `SVC(kernel="rbf")`).
- **SVM Regression**: Reverses the goal—tries to fit as many instances as possible *inside* the street (controlled by $\epsilon$).

## Key Concepts
- **Support Vectors**: The instances located on the edge of the "street" that fully determine the decision boundary.
- **C Hyperparameter**: Regularization parameter. Small $C \to$ wider street but more violations (higher bias, lower variance). Large $C \to$ narrower street but fewer violations (lower bias, higher variance).
- **$\gamma$ (Gamma)**: In RBF kernels, defines the range of influence of a single training instance. Small $\gamma \to$ smooth boundary. Large $\gamma \to$ irregular boundary wiggling around instances.

## Techniques
- **LinearSVC**: Optimized for linear SVMs ($O(m \times n)$ complexity).
- **SVC**: Supports the kernel trick; best for nonlinear data but scales poorly to large datasets ($O(m^2 \times n)$ to $O(m^3 \times n)$).
- **StandardScaler**: Crucial for SVMs because they are highly sensitive to feature scales.

## Anti-patterns
- **Using SVC on Millions of Instances**: It will be extremely slow. Use `LinearSVC` or `SGDClassifier` instead for large-scale linear problems.
- **Ignoring Scaling**: If one feature has a much larger range, the SVM will ignore other features.

## Connects To
- **Ch 4**: Like Logistic Regression, SVMs use a decision function, but with the Hinge Loss.
- **Ch 11**: Many deep learning techniques use kernels and regularization concepts similar to SVMs.
