# Chapter 6: Decision Trees

## Core Idea
Decision Trees are "white box" models that provide intuitive, hierarchical rules for classification and regression. They require very little data preparation and are the building blocks of Random Forests.

## Frameworks Introduced
- **CART (Classification and Regression Tree)**: The algorithm used by Scikit-Learn to grow trees by greedily searching for the best feature and threshold to split nodes.
- **Gini Impurity**: Default measure of node "purity". $G=0$ means all instances in the node belong to one class.
- **Entropy**: Alternative impurity measure from information theory. Leads to slightly more balanced trees.

## Key Concepts
- **Nonparametric Model**: A model where the number of parameters is not fixed before training (like trees), making them prone to overfitting.
- **Decision Boundaries**: For trees, these are always orthogonal (perpendicular to an axis).
- **Root Node / Leaf Node**: The top node and the final "pure" (or stopped) nodes that provide the prediction.
- **Regularization Hyperparameters**:
  - `max_depth`: Limits the depth of the tree.
  - `min_samples_split`: Min samples a node must have to be split.
  - `min_samples_leaf`: Min samples a leaf node must have.
  - `max_leaf_nodes`: Limits the total number of leaves.

## Techniques
- **Tree Visualization**: Using `export_graphviz` to generate `.dot` files and view the decision rules.
- **Regression Trees**: Predict the average target value of the instances in the leaf node; minimize MSE instead of impurity.

## Anti-patterns
- **Unconstrained Growth**: Leaving `max_depth=None` on a noisy dataset will almost always lead to severe overfitting.
- **Sensitivity to Rotation**: Rotating the dataset by 45° can make a simple boundary extremely complex for a tree. Use PCA to rotate data into a better orientation.

## Key Takeaways
1. Trees are highly interpretable and require no feature scaling.
2. They have high variance (stochastic training); small changes in data can lead to very different trees.
3. Use regularization to control the "wiggliness" of the decision boundaries.

## Connects To
- **Ch 7**: Combining many trees into a Random Forest to reduce variance.
- **Ch 8**: Using PCA to help trees by reducing feature correlation.
