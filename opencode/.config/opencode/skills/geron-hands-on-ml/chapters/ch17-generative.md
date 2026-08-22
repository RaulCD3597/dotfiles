# Chapter 17: Autoencoders, GANs, and Diffusion Models

## Core Idea
Unsupervised generative learning: models that don't just classify data, but learn its internal structure to compress it (Autoencoders) or generate new, realistic samples (GANs, Diffusion).

## Frameworks Introduced
- **Autoencoders**:
  - **Undercomplete**: Coding layer is smaller than inputs (forces compression).
  - **Stacked**: Multiple hidden layers for complex features.
  - **Convolutional**: Best for images; uses `Conv2DTranspose` to upscale.
  - **Denoising**: Recovers original data from noisy inputs (robust feature extraction).
  - **Sparse**: Pushed to have only a few active neurons in the coding layer (KL Divergence).
  - **Variational (VAE)**: Probabilistic and generative; codings are sampled from a Gaussian distribution.
- **Generative Adversarial Networks (GANs)**: Two competing networks:
  - **Generator**: Tries to produce fake data that looks real.
  - **Discriminator**: Tries to tell real data from fake data.
- **Diffusion Models (DDPM)**: Generative models that learn to reverse a noise-adding process. High quality but slow.

## Key Concepts
- **Latent Representation (Codings)**: The compressed version of the input data.
- **Reconstruction Loss**: MSE between input and output.
- **Latent Loss**: In VAEs, the KL divergence that pushes codings to follow a Gaussian distribution.
- **Adversarial Training**: Competing neural networks (Generator vs. Discriminator).
- **Mode Collapse**: A common GAN failure where the generator only produces one type of image (e.g., only "zeros" for MNIST).

## Techniques
- **Tying Weights**: Setting decoder weights equal to the transpose of encoder weights (halves parameters).
- **Semantic Interpolation**: Smoothly transitioning between two images by interpolating in the latent space.
- **Custom Training Loops**: GANs require `tf.GradientTape` because their training process involves two alternating phases.

## Anti-patterns
- **Training GANs with `fit()`**: The standard Keras `fit()` doesn't support the alternating phases of GAN training. Use a custom loop or override `train_step()`.
- **Ignoring GAN Instability**: GANs are notoriously hard to train. Use `tanh` in the generator output, `label_smoothing`, or standard architectures like DCGAN.

## Key Takeaways
1. Autoencoders are great for unsupervised pretraining and denoising.
2. VAEs are easier to train than GANs and offer a smooth latent space.
3. GANs produce the sharpest and most realistic images but are very unstable during training.

## Connects To
- **Ch 11**: Unsupervised pretraining using autoencoders.
- **Ch 12**: Custom layers and training loops.
