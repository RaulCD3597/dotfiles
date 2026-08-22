# Chapter 13: Loading and Preprocessing Data with TensorFlow

## Core Idea
Efficiently handling massive datasets that don't fit in memory using the `tf.data` API and the TFRecord format. This chapter covers the "Data Pipeline" that keeps GPUs busy by preprocessing data on the CPU in parallel.

## Frameworks Introduced
- **tf.data API**:
  - `Dataset`: Represents a stream of data items.
  - `interleave()`: Parallel reading from multiple files.
  - `prefetch()`: CPU/GPU parallelism (CPU prepares next batch while GPU trains).
- **TFRecord**: TensorFlow's high-performance binary format containing serialized Protocol Buffers.
- **Example Protobuf**: Standard format for a single training instance (features mapped to `BytesList`, `FloatList`, or `Int64List`).
- **Keras Preprocessing Layers**:
  - `Normalization`: Standardize features.
  - `TextVectorization`: Tokenize and vectorize text.
  - `CategoryEncoding`: One-hot or multi-hot encoding.
  - `StringLookup`: Map strings to integer IDs.

## Key Concepts
- **Training/Serving Skew**: When preprocessing code differs between training and production. Solution: embed preprocessing layers directly in the model.
- **Autotuning**: Using `tf.data.AUTOTUNE` to let TensorFlow choose the optimal number of threads dynamically.
- **Shuffling Buffer**: A buffer that holds a subset of the data; items are pulled randomly and replaced. Buffer must be large for effective shuffling.

## Techniques
- **Building a Pipeline**: `list_files` -> `interleave` -> `map` (preprocess) -> `shuffle` -> `batch` -> `prefetch`.
- **Handling Categorical Features**: Use `StringLookup` to map strings to IDs, followed by `Embedding` (for many categories) or `CategoryEncoding` (for few).
- **Masking**: Setting `mask_zero=True` in an `Embedding` layer to make RNNs ignore padding tokens.

## Code Examples
```python
# Standard tf.data Pipeline
dataset = tf.data.Dataset.list_files(train_filepaths)
dataset = dataset.interleave(
    lambda filepath: tf.data.TextLineDataset(filepath).skip(1),
    cycle_length=5, num_parallel_calls=tf.data.AUTOTUNE)
dataset = dataset.map(preprocess_fn, num_parallel_calls=tf.data.AUTOTUNE)
dataset = dataset.shuffle(10000).batch(32).prefetch(1)
```

## Anti-patterns
- **CPU Bottlenecks**: If the GPU is waiting for data, your `map` or `interleave` logic is too slow. Use `num_parallel_calls` and `prefetch`.
- **Repeating Shuffle**: Call `shuffle()` *before* `repeat()` if you want a different order every epoch.

## Key Takeaways
1. Prefetching is the single most important performance optimization for data pipelines.
2. TFRecords are great for complex data (images, audio) but CSV is fine for simpler tasks if it's not a bottleneck.
3. Preprocessing layers embedded in the model ensure the model is "portable" and safe from skew.

## Connects To
- **Ch 14**: Image preprocessing (resizing, augmentation).
- **Ch 16**: NLP pipelines (tokenization, subwords).
