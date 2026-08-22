# Chapter 7: Ensemble Learning and Random Forests

## Core Idea
"The wisdom of the crowd": Aggregating predictions from a group of diverse predictors (an ensemble) usually results in better performance than the best individual predictor.

## Frameworks Introduced
- **Voting Classifiers**:
  - **Hard Voting**: Majority vote of the individual classifiers.
  - **Soft Voting**: Average of the predicted class probabilities (requires `predict_proba()`); usually performs better.
- **Bagging (Bootstrap Aggregating)**: Training the same algorithm on different random subsets of the training set *with* replacement.
- **Pasting**: Same as bagging but *without* replacement.
- **Random Forests**: An ensemble of Decision Trees, typically trained via bagging with extra randomness in feature selection.
- **Boosting**: Training predictors sequentially, each trying to correct its predecessor.
  - **AdaBoost**: Increases weights of misclassified instances.
  - **Gradient Boosting**: Fits the new predictor to the *residual errors* of the previous one.
- **Stacking (Stacked Generalization)**: Training a "blender" (meta-learner) to aggregate the predictions of all predictors.

## Key Concepts
- **OOB (Out-of-Bag) Evaluation**: Using the ~37% of instances not sampled during bagging to evaluate the ensemble, removing the need for a separate validation set.
- **Feature Importance**: Random Forests can measure the relative importance of each feature by looking at how much they reduce impurity across the forest.
- **Extra-Trees (Extremely Randomized Trees)**: Uses random thresholds for each feature instead of searching for the best one (faster and more regularized).
- **HGB (Histogram-based Gradient Boosting)**: Optimized implementation for large datasets ($>10,000$ instances) that bins features into integers.

## Techniques
- **Subsampling**: In Gradient Boosting, training each tree on a fraction of the instances (`subsample=0.25`) to reduce variance.
- **Early Stopping**: Stopping the addition of trees when validation error stops improving (using `n_iter_no_change`).

## Anti-patterns
- **Sequential Training for Large Data**: Boosting cannot be parallelized easily (unlike bagging). For huge datasets, use HGB or libraries like XGBoost/LightGBM.

## Key Takeaways
1. Ensembles reduce variance significantly.
2. Random Forests are excellent for quick prototypes and heterogeneous tabular data.
3. If an ensemble is overfitting, try regularizing the base estimators or reducing the number of predictors.

## Connects To
- **Ch 6**: The base component of Random Forests.
- **Ch 19**: Deploying these models at scale.
