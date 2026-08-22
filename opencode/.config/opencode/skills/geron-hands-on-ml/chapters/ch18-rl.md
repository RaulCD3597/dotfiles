# Chapter 18: Reinforcement Learning

## Core Idea
Training agents to make decisions in an environment to maximize rewards. RL is the foundation of systems that play games (AlphaGo) or control robots.

## Frameworks Introduced
- **Policy Gradients (PG)**: Directly optimizing the policy parameters by following the gradients toward higher rewards (e.g., REINFORCE algorithm).
- **Markov Decision Processes (MDP)**: Mathematical framework for modeling decision-making where outcomes are partly random and partly under control.
- **Q-Learning**: Off-policy algorithm that learns the quality (Q-value) of state-action pairs without knowing the transition probabilities.
- **Deep Q-Learning (DQN)**: Using a Deep Neural Network to approximate Q-values for environments with massive state spaces (e.g., Atari games).

## Key Concepts
- **Agent / Environment / Reward**: The three core components of RL.
- **Policy**: The "brain" of the agent; a function mapping observations to actions.
- **Discount Factor ($\gamma$)**: Measures how much the agent values future rewards compared to immediate ones.
- **Credit Assignment Problem**: Knowing which specific action led to a delayed reward.
- **Action Advantage**: A measure of how much better an action is than the average action for a state.
- **Exploration vs. Exploitation**: Trying new things vs. using what works.
  - **$\epsilon$-greedy policy**: Acting randomly with probability $\epsilon$.
- **Experience Replay**: Storing past experiences in a buffer and sampling from it to train the DQN (breaks correlations).

## Techniques
- **OpenAI Gym**: Toolkit for standard RL environments (`env.make()`, `env.step()`, `env.reset()`).
- **Target Networks**: In DQN, using a separate, stable network to compute target Q-values (improves stability).
- **Double DQN**: Using two networks to reduce the overestimation of Q-values.

## Anti-patterns
- **Deterministic Policies during Training**: If the agent never explores, it will never find the optimal path. Use $\epsilon$-greedy or stochastic policies.
- **Training on Correlated Steps**: Consecutive steps in an episode are highly correlated. Use Experience Replay.

## Key Takeaways
1. RL is a trial-and-error process guided by sparse rewards.
2. Policy Gradients are "on-policy"; Q-learning is "off-policy".
3. Deep RL (DQN) enabled solving complex tasks with raw pixel inputs.

## Connects To
- **Ch 10**: Neural networks as policies.
- **Ch 19**: Deploying RL agents.
