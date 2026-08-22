# Chapter 2: End-to-End Machine Learning Project

## Core Idea
The machine learning project workflow follows a structured path from framing the problem to launching and monitoring the system. This chapter uses the California Housing Prices dataset to walk through this entire lifecycle.

## Frameworks Introduced
- **The ML Pipeline**: A sequence of data processing components (e.g., fetching -> cleaning -> scaling -> training).
- **Stratified Sampling**: Dividing the population into homogeneous strata (e.g., income categories) to ensure the test set is representative of the whole population.
- **Scikit-Learn API Design**:
  - **Estimators**: Any object that estimates parameters based on a dataset (via `fit()`).
  - **Transformers**: Estimators that can also transform a dataset (via `transform()` or `fit_transform()`).
  - **Predictors**: Estimators capable of making predictions (via `predict()`).
- **Ensemble Learning**: Combining multiple models (like multiple Decision Trees in a Random Forest) to boost performance.

## Key Concepts
- **RMSE (Root Mean Square Error)**: Standard performance measure for regression; sensitive to outliers.
- **MAE (Mean Absolute Error)**: Preferred if there are many outliers.
- **Data Snooping Bias**: Overfitting the model to patterns found in the test set by looking at it too early.
- **Imputation**: Filling in missing values (e.g., using `SimpleImputer` with the median).
- **One-Hot Encoding**: Converting categorical attributes into binary "dummy" attributes.
- **Feature Scaling**:
  - **Min-Max Scaling (Normalization)**: Rescaling values to a 0-1 range (using `MinMaxScaler`).
  - **Standardization**: Subtracting the mean and dividing by the standard deviation (using `StandardScaler`).
- **K-fold Cross-Validation**: Splitting the training set into K folds to evaluate the model multiple times and get a precise performance estimate.

## Techniques
- **Handling Heavy Tails**: Replace the feature with its logarithm or square root to make the distribution more Gaussian.
- **Handling Multimodal Distributions**: Use bucketizing or Gaussian RBF (Radial Basis Function) similarity features to capture peaks.
- **Custom Transformers**: Create classes inheriting from `BaseEstimator` and `TransformerMixin` to implement custom logic that integrates with Scikit-Learn pipelines.
- **ColumnTransformer**: Apply different transformations to different columns (e.g., numerical vs. categorical) in a single step.

## Anti-patterns
- **Training on the Test Set**: Never let the model "see" the test set during training or fine-tuning.
- **Scaling the Whole Dataset**: Always fit scalers on the *training set only*, then use those learned parameters to transform the test set and new data.
- **get_dummies() in Production**: `pd.get_dummies()` is fine for exploration but doesn't handle unknown categories or maintain column order like `OneHotEncoder` does.

## Key Takeaways
1. Frame the problem first: understand the business objective and how the model's output will be used.
2. Automate data fetching and preprocessing: it makes the project reproducible and easier to maintain.
3. Start with a baseline: train simple models (Linear Regression) before jumping into complex ones (Random Forests).
4. Use cross-validation: it provides a more reliable measure of model performance than a single validation split.

## Connects To
- **Ch 1**: Foundation for supervised vs. unsupervised learning.
- **Ch 4**: Deep dive into the math behind Linear and Logistic Regression.
- **Ch 6 & 7**: Detailed mechanics of Decision Trees and Random Forests.
- **Ch 10-19**: Moving from classic ML to Deep Learning with TensorFlow and Keras.
