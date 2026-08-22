# Chapter 14: Deep Computer Vision Using Convolutional Neural Networks

## Core Idea
CNNs are inspired by the visual cortex and are the state of the art for image recognition. They use partially connected layers and weight sharing to handle the high dimensionality of images efficiently.

## Frameworks Introduced
- **Convolutional Layers**: Neurons are only connected to a small local receptive field. They learn *filters* (kernels) that detect specific patterns (edges, shapes).
- **Pooling Layers**: Shrink the image to reduce computation and parameters.
  - **Max Pooling**: Keeps only the strongest signal (most common).
  - **Average Pooling**: Computes the mean (less common).
  - **Global Average Pooling**: Computes the mean of each entire feature map (used before the output layer).
- **Classic CNN Architectures**:
  - **LeNet-5**: The 1998 ancestor for MNIST.
  - **AlexNet**: Stacked conv layers, Dropout, and Data Augmentation (2012).
  - **GoogLeNet**: Inception modules (using $1 \times 1$ convs as bottlenecks).
  - **ResNet**: Residual blocks with skip connections (allows training of 100+ layers).
  - **Xception / MobileNet**: Optimized for efficiency and mobile devices.

## Key Concepts
- **Feature Map**: The output of a convolutional layer for a specific filter.
- **Zero Padding**: Adding zeros around the input to control output size (`padding="same"` vs `"valid"`).
- **Stride**: The step size between receptive fields.
- **Receptive Field**: The small area of the previous layer a neuron "sees".
- **Weight Sharing**: All neurons in a feature map use the same weights, dramatically reducing parameters.
- **Invariance vs. Equivariance**:
  - **Invariance**: Output stays the same if input is slightly shifted (good for classification).
  - **Equivariance**: Output shifts with the input (good for segmentation).

## Techniques
- **Implementing in Keras**: `Conv2D(filters=32, kernel_size=3, padding="same", activation="relu")`.
- **Data Augmentation**: Generating realistic variants (flips, rotations, shifts) to prevent overfitting.
- **Transfer Learning**: Reusing a pretrained model (e.g., ResNet-50 from `tf.keras.applications`) and fine-tuning it on your data.

## Anti-patterns
- **Kernels too Large**: Large kernels (e.g., $7 \times 7$) are computationally expensive. Two stacked $3 \times 3$ layers are usually better.
- **Missing Scaling**: CNNs are sensitive to image scales; always rescale pixels to 0–1 or –1 to 1.

## Key Takeaways
1. CNNs are much better than dense nets for images because they capture local patterns.
2. Skip connections are the "superpower" that enabled very deep networks.
3. Always start with a pretrained model (Transfer Learning) for image tasks.

## Connects To
- **Ch 11**: Transfer learning concepts.
- **Ch 17**: Using CNNs in Autoencoders and GANs.
