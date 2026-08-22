# Hands-on Machine Learning Cheatsheet

## Choosing an Optimizer (Ch 11)
| Optimizer | Description | Recommendation |
|---|---|---|
| **SGD** | Basic Gradient Descent | Good with learning rate decay, but slow. |
| **Momentum** | Adds momentum to SGD | Faster than SGD. |
| **Adam / Nadam** | Adaptive moment estimation | **Standard default** for most tasks. |
| **RMSProp** | Adaptive learning rate | Good for RNNs. |

## Activation Functions (Ch 11)
| Function | Formula | Use Case |
|---|---|---|
| **ReLU** | `max(0, z)` | Standard default for hidden layers. |
| **Leaky ReLU** | `max(az, z)` | Use if you see "dying ReLUs". |
| **ELU** | `a(exp(z)-1)` if $z<0$ | Smooth, can be better than ReLU but slower. |
| **SELU** | Scaled ELU | For deep MLPs (Self-Normalizing). |
| **Softmax** | $\frac{exp(z_i)}{\sum exp(z_j)}$ | **Output layer** for multiclass classification. |
| **Sigmoid** | $1/(1+exp(-z))$ | **Output layer** for binary classification. |

## Loss Functions (Ch 10, 12, 13)
| Task | Loss String | Activation |
|---|---|---|
| Regression | `"mse"` or `"huber"` | None |
| Binary Classification | `"binary_crossentropy"` | `sigmoid` |
| Multiclass (Integer) | `"sparse_categorical_crossentropy"` | `softmax` |
| Multiclass (One-hot) | `"categorical_crossentropy"` | `softmax` |

## Common `tf.data` Pipeline Template (Ch 13)
```python
dataset = tf.data.Dataset.list_files("*.csv")
dataset = dataset.interleave(lambda f: tf.data.TextLineDataset(f).skip(1), cycle_length=5)
dataset = dataset.map(preprocess_fn, num_parallel_calls=tf.data.AUTOTUNE)
dataset = dataset.shuffle(buffer_size).batch(32).prefetch(1)
```

## Quick Reference Rules
- **Overfitting?** -> More data, simpler model, regularization (Dropout, $L_2$), or smaller `max_depth` (trees).
- **Underfitting?** -> More complex model, better features, reduce regularization.
- **Vanishing Gradients?** -> Use BN, He initialization, or ReLU variants.
- **Exploding Gradients?** -> Use Gradient Clipping (especially for RNNs).
- **Scarce Labeled Data?** -> Transfer Learning or Unsupervised Pretraining.
