# Chapter 10: Introduction to Artificial Neural Networks with Keras

## Core Idea
Transitioning from "classic" ML to Deep Learning. This chapter covers the history of ANNs, the architecture of Multilayer Perceptrons (MLPs), and how to use the Keras Sequential API for classification and regression.

## Frameworks Introduced
- **The Perceptron**: Simplest ANN architecture; uses Threshold Logic Units (TLUs) and the Heaviside step function.
- **Multilayer Perceptron (MLP)**: Stack of one input layer, one or more hidden layers, and one output layer.
- **Keras Sequential API**: Simple stack of layers connected sequentially (best for 95% of use cases).
- **Regression MLP**: Typically uses no activation in the output layer (or ReLU/Softplus for positive values).
- **Classification MLP**:
  - **Binary**: 1 output neuron + Sigmoid.
  - **Multiclass**: N output neurons + Softmax.
  - **Multilabel**: N output neurons + Sigmoid for each.

## Key Concepts
- **Backpropagation**: The standard training technique; uses reverse-mode autodiff and Gradient Descent.
- **Activation Functions**: Crucial for nonlinearity.
  - **ReLU**: Most common (fast, reduces vanishing gradients).
  - **Sigmoid/Tanh**: S-shaped (can saturate).
- **Loss Functions**:
  - `sparse_categorical_crossentropy`: For sparse labels (0, 1, 2...).
  - `categorical_crossentropy`: For one-hot labels ([1,0,0], [0,1,0]...).
  - `binary_crossentropy`: For binary/multilabel classification.
- **Hyperparameters**: # hidden layers, neurons per layer, learning rate, optimizer.

## Techniques
- **Building a Model**: `tf.keras.Sequential([layers])`.
- **Compiling**: `model.compile(loss=..., optimizer=..., metrics=[...])`.
- **Training**: `model.fit(X_train, y_train, epochs=..., validation_data=...)`.
- **Checkpointing**: Using `ModelCheckpoint` callback to save the best version of the model.

## Anti-patterns
- **Zero Weight Initialization**: Never initialize weights to zero (breaks symmetry); Keras uses Glorot/He by default.
- **Deep Nets without Nonlinearity**: Multiple linear layers are mathematically equivalent to a single linear layer.
- **Training for 1 Epoch**: Deep models almost always need many epochs to converge.

## Key Takeaways
1. Keras is the high-level, simple API; TensorFlow is the underlying engine.
2. Standardize inputs: Gradient Descent performs poorly without scaling.
3. ReLU is the standard hidden activation; Softmax is the standard multiclass output activation.

## Connects To
- **Ch 11**: Deep dive into training issues (vanishing gradients, optimizers).
- **Ch 12**: Building custom layers and models using the Functional or Subclassing API.
