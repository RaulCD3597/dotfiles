# Chapter 15: Processing Sequences Using RNNs and CNNs

## Core Idea
Handling data that flows through time: time series, audio, or text. Recurrent Neural Networks (RNNs) have "memory" by feeding their own outputs back as inputs for the next step.

## Frameworks Introduced
- **RNN Architectures**:
  - **Sequence-to-Sequence**: Input sequence $\to$ Output sequence (e.g., time series forecasting).
  - **Sequence-to-Vector**: Input sequence $\to$ Single vector (e.g., sentiment analysis).
  - **Vector-to-Sequence**: Single vector $\to$ Output sequence (e.g., image captioning).
  - **Encoder-Decoder**: Sequence $\to$ Vector $\to$ Sequence (e.g., translation).
- **Memory Cells**:
  - **SimpleRNN**: Basic but limited (vanishing gradients, short-term memory).
  - **LSTM (Long Short-Term Memory)**: Adds a long-term state to handle long sequences.
  - **GRU (Gated Recurrent Unit)**: Simplified version of LSTM; often performs just as well.
- **1D CNNs**: Using 1D convolutions to process sequences (fast, good for long sequences).
- **WaveNet**: A stack of dilated 1D convolutions for extremely long sequences (audio).

## Key Concepts
- **BPTT (Backpropagation Through Time)**: Unrolling the RNN through time and applying regular backprop.
- **Hidden State ($h_t$)**: The internal memory of the cell at time $t$.
- **Seasonality & Trend**: Patterns in time series (weekly, monthly, etc.).
- **Differencing**: Subtracting past values to make a time series stationary.
- **Naive Forecasting**: Baseline where you just copy the latest (or seasonal) value.

## Techniques
- **Preprocessing for RNNs**: Keras `timeseries_dataset_from_array()` helps build windowed training sets.
- **Ahead Forecasting**:
  - **Step-by-Step**: Use model to predict $t+1$, then use that prediction to predict $t+2$.
  - **One-Shot**: Model outputs a vector of size $N$ for the next $N$ steps.
- **Layer Normalization**: Often works better than Batch Normalization for RNNs.

## Anti-patterns
- **Large Batches in RNNs**: RNNs are inherently sequential; very large batches might not fit in memory due to BPTT unrolling.
- **Ignoring Return Sequences**: Set `return_sequences=True` for all but the last RNN layer when stacking them.

## Key Takeaways
1. Simple RNNs struggle with sequences longer than ~10 steps. Use LSTM or GRU.
2. 1D CNNs are a great, faster alternative to RNNs for many sequence tasks.
3. Always establish a naive baseline (e.g., "tomorrow is like today") before building complex models.

## Connects To
- **Ch 16**: RNNs for Natural Language Processing and Attention mechanisms.
- **Ch 11**: Vanishing gradient issues and LayerNorm.
