 ## Inverse Kinematics Solution using Newton-Raphson Method in MATLAB  
 
#### Newton-Raphson numerical method for finding the inverse kinematics solution of a serial manipulator. This method is presented as an efficient and faster alternative to the `solve` command in MATLAB, especially beneficial for **online programming and real-time robot control** due to its computational perspective.
---
#### I. Purpose and Advantages of Newton-Raphson Method

*   **Goal**: To find the joint angles (e.g., θ1 and θ2 for a 2R manipulator) when the end-effector's position (x and y) is known.
*   **Alternative to `solve`**: While the `solve` command can be used if forward kinematics solutions are available, it is **"not the right option all the time"**.
*   **Computational Efficiency**: The Newton-Raphson method is a **faster numerical method** compared to closed-form solutions, making it more beneficial for real-time applications.
---  
#### II. Application Example: 2R Planar Serial Manipulator

*   This example is chosen because **visualization is easy**, though the Newton-Raphson method is not restricted to planar manipulators or those with fewer degrees of freedom; it can be used for **any serial manipulator**.
*   The link lengths (L1 and L2) are assumed to be **1 unit each**.
---
#### III. Core Algorithm and Methodology

The Newton-Raphson method is an **iterative process**. The general idea is to start with an initial guess for the joint angles and iteratively refine them until the estimated end-effector position is sufficiently close to the desired (actual) end-effector position.
---
**Key Concepts and Steps**:

1.  **Known Inputs**:
    *   **J(q_i)**: The **Jacobian matrix** of the manipulator, which represents the partial derivatives of the end-effector position with respect to each joint angle.
    *   **q_initial_guess**: An initial guess for the joint angles.
    *   **μ**: The **actual (target) end-effector position** (e.g., [x, y] coordinates), which is a function of 'q' (joint angles). In the example, `mu_a` (mu actual) is directly provided or assumed for testing.
    *   **Forward Kinematic Relation**: This is needed to calculate the `mu_estimated` (estimated end-effector position) from the current joint angles.

2.  **Iterative Update Rule**: The core of the Newton-Raphson method for inverse kinematics is described by the equation:
    **q<sub>i+1</sub> = q<sub>i</sub> + J(q<sub>i</sub>)<sup>-1</sup> * Δμ**
    *   Here, `q_i` represents the current guess of the joint angles.
    *   `q_i+1` is the updated guess for the next iteration.
    *   `J(q_i)<sup>-1</sup>` is the inverse of the Jacobian matrix evaluated at `q_i`.
    *   **Δμ (Delta Mu)**: This represents the **error** between the actual (target) end-effector position and the estimated end-effector position at the current iteration.
        *   **Δμ = μ_actual - μ_estimated**.
        *   This is a crucial change from a `delta_i` to `delta_mu` because `delta_i` (change in joint angle) would not be directly available, but the error in end-effector position (`delta_mu`) can be restricted.

3.  **Termination Conditions**: The iterative process stops when:
    *   The **absolute value of Δμ is less than or equal to a defined tolerance** (e.g., 10<sup>-5</sup>). This is the primary convergence condition.
    *   A **maximum iterative count** (e.g., 100 or 10 for demonstration) is reached, even if the tolerance is not met. This prevents infinite loops.
---
#### IV. MATLAB Code Implementation Details

The lecture walks through the MATLAB code for implementing this method:

*   **Initial Setup**: Define link lengths `L1 = 1` and `L2 = 1`.
*   **Defining `mu_actual`**: For demonstration, an actual `mu` value (target x, y) is determined by assuming a known `theta_1` and `theta_2` (e.g., `theta_1 = 0`, `theta_2 = 90` leading to `mu_a =`). It is emphasized that in a real scenario, `mu_a` would be a directly given target value.
*   **Initial Guess (`q_initial_guess`)**: An initial guess for the joint angles is set (e.g., `pi/3` for both θ1 and θ2).
*   **Iterative Loop**: A `for` loop (or similar) runs up to the maximum iterative count.
    *   Inside the loop, the current joint angles `q` are used to calculate the **Jacobian matrix**.
    *   The **forward kinematic relation** is used to calculate `mu_estimated`.
    *   **`delta` (Δμ)** is calculated as `mu_actual - mu_estimated`.
    *   **Tolerance Check**: An `if` statement checks if the `abs(delta)` is less than `10^-5`. If true, the `break` command stops the algorithm.
    *   **Update**: If the tolerance is not met, the joint angles `q` are updated using the formula: `q = q + inverse(J) * delta`. The variable `q` itself is updated to avoid storing multiple arrays.
*   **Visualization**: The code includes plotting commands to **visually show the 2R serial manipulator's movement** from the initial guess to the converged solution over iterations. This helps to see how the manipulator's configuration changes with each update of `q`.
---
#### V. Performance and Observations

*   **Convergence**:
    *   If the **initial guess is closer to the true solution**, the algorithm converges **immediately (e.g., in 3 or 4 iterations)**.
    *   Different initial guesses can lead to **different converged solutions** (e.g., for redundant manipulators or those with multiple inverse kinematic solutions).
    *   **Starting points closer to an "inflection point" or "singular point"** can cause the Jacobian matrix to become **non-invertible** or close to it. In such cases, the algorithm might:
        *   Still **somehow manage to converge** but may take **many more iterations**.
        *   Fail to converge within the maximum iteration count.
        *   Converge to an **"exact opposite solution"** or oscillate if the initial guess is too close to a singular point related to an opposite solution.
*   **Jittery Movement (Not from Source)**: *The previous discussion on Strain Wave Gears mentioned "jittery" movement, but this is not discussed in the context of the Inverse Kinematics solution of a robotic manipulator in the provided source. This might be a confusion between the two separate topics.*
*   **Adaptability**: The code structure is general; only the **Jacobian matrix and the `mu` vector** (forward kinematics) need to be changed to apply the method to **any other manipulator**. The `mu_actual` would typically be given as a direct value.
