# Chapter 11: Training Deep Neural Networks

## Core Idea
Deep nets are hard to train. This chapter provides the toolkit to solve the "Four Horsemen" of deep learning: vanishing/exploding gradients, slow training, lack of labeled data, and overfitting.

## Frameworks Introduced
- **Initialization Strategies**: Matching initialization to the activation function.
  - **Glorot (Xavier)**: For Sigmoid, Tanh, Softmax.
  - **He (Kaiming)**: For ReLU and its variants.
  - **LeCun**: For SELU.
- **Advanced Activation Functions**:
  - **Leaky ReLU**: Prevents "dying ReLUs" by having a small slope for $z < 0$.
  - **ELU / SELU**: Smooth variants; SELU provides self-normalization for deep MLPs.
  - **Swish / GELU / Mish**: State-of-the-art non-monotonic functions (default for complex tasks).
- **Batch Normalization (BN)**: Zero-centers and normalizes each input, then scales and shifts. Dramatically reduces vanishing gradients.
- **Transfer Learning**: Reusing lower layers of a pretrained model for a new task.

## Key Concepts
- **Vanishing/Exploding Gradients**: Gradients shrink/grow as they flow backward, making lower layers hard to train.
- **Self-Normalization**: Property of SELU where layer outputs preserve mean 0 and std 1 (requires LeCun init and standardized inputs).
- **Gradient Clipping**: Capping gradients at a threshold to prevent exploding (crucial for RNNs).
- **Faster Optimizers**:
  - **Momentum**: Accelerates like a ball down a hill.
  - **Nesterov (NAG)**: Measures gradient slightly ahead in direction of momentum (faster).
  - **AdaGrad / RMSProp**: Adapt the learning rate per parameter.
  - **Adam / Nadam**: Combine momentum and RMSProp (standard default).

## Techniques
- **Unsupervised Pretraining**: Train an autoencoder on unlabeled data first, then reuse its encoder.
- **Learning Rate Scheduling**: Reducing $\eta$ during training (Power, Exponential, Piecewise constant, 1cycle).
- **Regularization for Deep Nets**:
  - **Dropout**: Randomly "killing" neurons during training (20-50%).
  - **MC Dropout**: Using dropout at inference time to get a measure of uncertainty.
  - **Max-Norm**: Constraining the weights $\ell_2$ norm to a max value.

## Anti-patterns
- **Using Dropout with SELU**: Breaks self-normalization. Use AlphaDropout instead.
- **BN after Activation**: Original paper suggests before, but after is also common. Test both.

## Key Takeaways
1. Standard toolkit for deep nets: He init + ELU/Swish + BN + Early Stopping.
2. If data is scarce: find a pretrained model and use transfer learning.
3. Adam is a safe default optimizer, but 1cycle scheduling can be faster.

## Connects To
- **Ch 12**: Customizing the training loop (GradientTape).
- **Ch 14**: CNNs, which heavily rely on Transfer Learning and BN.
