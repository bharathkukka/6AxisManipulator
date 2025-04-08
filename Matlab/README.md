# Inverse Kinematics

To implement the inverse kinematics (IK) solution for my 6-degree-of-freedom (DOF) robotic manipulator, I used the Newton-Raphson method to iteratively solve for joint angles. The manipulator's goal is to reach a desired end-effector pose, which includes both position and orientation, in 3D space.

## Overview

The code calculates the joint angles of a 6-DOF robotic manipulator based on the desired end-effector position and orientation using the Newton-Raphson method.  
The method involves iteratively updating the joint angles by calculating the error in position and orientation, using the Jacobian matrix to propagate corrections.

## Key Concepts

- **Forward Kinematics**: The process of computing the position and orientation of the end-effector based on the joint angles of the manipulator.
  
- **Jacobian Matrix**: A matrix that relates the change in joint angles to the change in the end-effector's position and orientation. It's used to calculate how the joint angles should change to reduce the error between the current and desired end-effector pose.

- **Newton-Raphson Method**: An iterative numerical method used to find approximate solutions to equations. In this case, the method is applied to solve for the joint angles that minimize the error in the position and orientation of the manipulator.


- `inverse_kinematics.m`: The main script that performs inverse kinematics using the Newton-Raphson method.
- `forwardKinematicsAndJacobian.m`: A function that computes the forward kinematics and Jacobian matrix for the manipulator.
- `plotRobot.m`: A function that visualizes the manipulator's position and the desired target position.

## Description

### 1. **Initialization**

The code starts by defining:
- The robot's physical dimensions (link lengths, offsets, etc.).
- The desired position (`P_desired`) and orientation (`R_desired`) of the end-effector.
- The initial guess for the joint angles (`q`), set to zero.
- The tolerance for convergence (`tol`) and the maximum number of iterations (`max_iters`).

### 2. **Forward Kinematics and Jacobian Calculation**

The function `forwardKinematicsAndJacobian` computes the end-effector's position and orientation (`P_current`, `R_current`) using the Denavit-Hartenberg (DH) parameters for the manipulator. It also computes the Jacobian matrix (`J`), which relates the joint velocities to the end-effector's linear and angular velocities.

The manipulator's joint positions are also tracked for visualization purposes.

### 3. **Newton-Raphson Iterative Method**

The code iteratively computes the error between the desired and current position and orientation:
- **Position Error (`e_p`)**: The difference between the desired and current position of the end-effector.
- **Orientation Error (`e_o`)**: The angular difference between the desired and current orientation.

Using the Jacobian matrix (`J`), the code computes the change in joint angles (`delta_q`) that will reduce the error:
- The update step is given by: `delta_q = pinv(J) * error`.
- The joint angles are updated as: `q = q + delta_q`.

The loop continues until the norm of the total error is below the defined tolerance or the maximum number of iterations is reached.

### 4. **Convergence Check**

If the error in position and orientation falls below the tolerance (`tol`), the program outputs "Converged!". If the maximum number of iterations is reached without convergence, the program outputs "Max iterations reached without convergence."

### 5. **Visualization**

The function `plotRobot` visualizes the manipulator's joint positions and the desired end-effector position. The plot is updated at each iteration to show the manipulator's progress toward reaching the desired position.

## Newton-Raphson Method

The Newton-Raphson method is an iterative numerical technique used to find roots of a function. In the context of inverse kinematics, it is applied to find joint angles that minimize the error between the current and desired end-effector pose.

### Steps:
1. **Initial Guess**: Start with an initial guess for the joint angles (`q_0`).
2. **Compute Error**: Calculate the error in position and orientation.
3. **Jacobian**: Compute the Jacobian matrix, which describes how changes in joint angles affect the end-effector's position and orientation.
4. **Update Joint Angles**: Use the pseudo-inverse of the Jacobian matrix to update the joint angles:
   \[
   q_{new} = q_{old} + \Delta q = q_{old} + \text{Jacobian}^{-1} \times \text{error}
   \]
5. **Repeat**: Iterate until the error is below a specified tolerance or the maximum number of iterations is reached.

The Newton-Raphson method ensures that each iteration brings the system closer to the desired solution by adjusting the joint angles based on the current error.



### Running the Code

1. Set the desired pose of the manipulator by modifying the `P_desired` and `R_desired` variables.
2. Run the script `inverse_kinematics.m` in MATLAB.
3. The robot will attempt to converge to the desired pose, and the visualization will show its progress.
4. If the manipulator converges, the final joint angles will be displayed.

### Example

```matlab
% Desired pose
P_desired = [0.15; 0.0131; -0.004];
R_desired = eye(3);  % Identity matrix for no rotation

% Run the inverse kinematics solver
inverse_kinematics;
