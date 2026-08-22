# Machine Learning Design Patterns

## Training & Optimization
### 1. Scaling First
**When to use**: Before any Gradient Descent based model (Linear Reg, SVM, Neural Nets).
**How**: Use `StandardScaler` or `MinMaxScaler`. Never fit on the test set.

### 2. Baseline Before Complexity
**When to use**: Every new project.
**How**: Start with Naive forecasting (time series) or Linear Regression/SGDClassifier. Only move to Random Forests or Deep Learning if the baseline is insufficient.

### 3. Early Stopping
**When to use**: Iterative training (Gradient Descent, Boosting, Neural Nets).
**How**: Monitor validation error and stop when it hits a minimum to prevent overfitting.

### 4. Self-Normalization
**When to use**: Deep MLPs.
**How**: Use `SELU` activation + `lecun_normal` initialization + Standardized inputs.

## Data Pipelines
### 5. Embedded Preprocessing
**When to use**: Production models.
**How**: Include Keras preprocessing layers (`Normalization`, `TextVectorization`) directly in the `Model` or `Sequential` object to prevent training/serving skew.

### 6. Parallel Data Loading (Prefetching)
**When to use**: Large datasets using `tf.data`.
**How**: Always end your pipeline with `.prefetch(tf.data.AUTOTUNE)` to overlap CPU preprocessing and GPU training.

## Neural Architecture
### 7. Residual Learning (Skip Connections)
**When to use**: Deep networks (>10 layers).
**How**: Add the input of a block back to its output. This allows gradients to flow through "identity" shortcuts, preventing vanishing gradients.

### 8. Bottleneck Layers
**When to use**: To reduce computational cost in large CNNs.
**How**: Use $1 \times 1$ convolutions to reduce the number of channels before a $3 \times 3$ or $5 \times 5$ convolution.

### 9. Transfer Learning
**When to use**: Tasks with limited labeled data.
**How**: Freeze lower layers of a pretrained model (e.g., from `tf.keras.applications`), replace the top, and train. Fine-tune by unfreezing top layers later with a low learning rate.

## Reinforcement Learning
### 10. Experience Replay
**When to use**: DQN training.
**How**: Store (state, action, reward, next_state) tuples in a buffer and sample random batches for training to break temporal correlations.
