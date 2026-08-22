# Chapter 19: Training and Deploying TensorFlow Models at Scale

## Core Idea
Taking models from the research notebook to production. This chapter covers serving models via APIs, deploying to the cloud (Vertex AI), mobile/edge devices, and scaling training across multiple GPUs/TPUs.

## Frameworks Introduced
- **TF Serving**: C++ model server for low-latency REST or gRPC serving of SavedModels.
- **Vertex AI**: Google Cloud's platform for managed training, hyperparameter tuning (AutoML), and scalable model serving.
- **TFLite (TensorFlow Lite)**: Toolkit for deploying models to mobile and embedded devices.
  - **Quantization**: Compressing 32-bit floats to 8-bit integers (4x smaller).
- **Distribution Strategies API**: Simple API for training a model on multiple GPUs or servers (`MirroredStrategy`, `MultiWorkerMirroredStrategy`).

## Key Concepts
- **SavedModel**: The standard portable serialization format for TensorFlow models.
- **REST vs. gRPC**:
  - **REST**: Simple, JSON-based, text-heavy (higher latency).
  - **gRPC**: Binary (Protobuf), compact, extremely fast (preferred for production).
- **Model Warmup**: Running dummy requests during model loading to ensure all operations are initialized before live traffic hits.
- **Edge Computing**: Running models directly on the device (improves privacy, reduces latency/bandwidth).

## Techniques
- **Exporting for Serving**: `model.save("my_model/1", save_format="tf")`.
- **Quantization-Aware Training (QAT)**: Simulating quantization during training to minimize the accuracy drop when converting to 8-bit.
- **Hyperparameter Tuning at Scale**: Using Vertex AI's `HyperparameterTuningJob`.
- **GPU Quotas**: Managing and requesting GPU resources on cloud platforms.

## Code Examples
```python
# Multi-GPU Training
strategy = tf.distribute.MirroredStrategy()
with strategy.scope():
    model = build_model()
    model.compile(...)
model.fit(...) # Automatically distributed across GPUs!
```

## Anti-patterns
- **Manually Reimplementing Preprocessing**: This leads to training/serving skew. Embed your `TextVectorization` or `Normalization` layers inside the SavedModel.
- **Serving without gRPC**: For high-bandwidth tasks (like image classification), JSON overhead is massive. Use gRPC.

## Key Takeaways
1. Production models must be versioned and served asynchronously.
2. Vertex AI makes scaling training and serving trivial (but keep an eye on costs).
3. TFLite is the key to making "smart" apps and devices.

## Connects To
- **Ch 13**: Data pipelines for high-throughput training.
- **Ch 10**: Basics of saving and loading models.
