# Chapter 12: Custom Models and Training with TensorFlow

## Core Idea
Going beyond Keras: using TensorFlow's lower-level Python API to implement custom loss functions, metrics, layers, and models for advanced architectures (like GANs).

## Frameworks Introduced
- **Tensors & Variables**:
  - `tf.Tensor`: Immutable multidimensional arrays (NumPy compatible).
  - `tf.Variable`: Mutable tensors for weights and states.
- **Custom Components**:
  - **Loss**: Subclass `tf.keras.losses.Loss` and implement `call()`.
  - **Metric**: Subclass `tf.keras.metrics.Metric` and implement `update_state()` (streaming/stateful).
  - **Layer**: Subclass `tf.keras.layers.Layer` and implement `build()` and `call()`.
  - **Model**: Subclass `tf.keras.Model`.

## Key Concepts
- **Reverse-mode Autodiff**: Automatically computing gradients using `tf.GradientTape`.
- **TF Functions**: Annotating Python functions with `@tf.function` to compile them into optimized computation graphs (JIT compilation).
- **Broadcasting**: Adding a vector to a matrix (repeats the vector for each row).
- **Ragged Tensors**: Represent lists of tensors with varying sizes (e.g., sentences of different lengths).

## Techniques
- **GradientTape**: Manually controlling backpropagation for custom training loops.
- **add_loss() / add_metric()**: Defining losses or metrics based on internal layer activations (e.g., reconstruction loss).
- **get_config()**: Implementing this method in custom classes is *required* to make them serializable for `save()` and `load_model()`.

## Code Examples
```python
# Custom Loss
class HuberLoss(tf.keras.losses.Loss):
    def __init__(self, threshold=1.0, **kwargs):
        self.threshold = threshold
        super().__init__(**kwargs)
    def call(self, y_true, y_pred):
        # ... logic using tf.where ...
    def get_config(self):
        return {**super().get_config(), "threshold": self.threshold}

# GradientTape Training Loop
with tf.GradientTape() as tape:
    y_pred = model(X_batch)
    loss = loss_fn(y_batch, y_pred)
grads = tape.gradient(loss, model.trainable_variables)
optimizer.apply_gradients(zip(grads, model.trainable_variables))
```

## Anti-patterns
- **Using non-TF ops in @tf.function**: Using `np.sum()` or `print()` inside a compiled function will only run during tracing (the first time), not in the actual graph. Use `tf.reduce_sum()` and `tf.print()`.

## Key Takeaways
1. Use Keras for 95% of tasks; use lower-level TF for the 5% that require custom logic.
2. Always implement `get_config()` to avoid losing hyperparameters during saving.
3. TF 32-bit floats are the standard; avoid 64-bit unless precision is critical (it's slower).

## Connects To
- **Ch 13**: `tf.data` uses these low-level ops for efficient parsing.
- **Ch 17**: GANs require the custom training loop (`GradientTape`) approach.
