# 🧠 Inverse Kinematics using Newton-Raphson Iteration

Numerical approach to solving Inverse Kinematics (IK) problems using the **Newton-Raphson method** and the **Jacobian pseudo-inverse**.

---

## 1. Introduction to Inverse Kinematics (IK)

**Inverse Kinematics (IK)** involves computing joint parameters (e.g., angles or displacements) required to place a robot's **end-effector** at a desired pose (position and orientation).

Given:
- A robot with `n` joints (degrees of freedom) n=6,
- A known forward kinematics function: `T = f(q)`,  
  where `q` is the vector of joint variables and `T` is the end-effector pose (position + orientation).

**Goal:** Find `q` such that:

```text
f(q) = desired_pose
````

---

## 🔁 2. Why Use Numerical Methods Like Newton-Raphson?

In practice:

* **Analytical IK** is often difficult due to nonlinear and coupled equations.
* **Newton-Raphson** offers a general, iterative method for finding an approximate solution to nonlinear systems.

---

## 🧮 3. Newton-Raphson Method Overview

We want to solve:

```text
F(q) = 0
```

Where `F(q)` is the **error vector** between the current and desired end-effector pose.

### Iterative Update Rule:

```text
q_(i+1) = q_i + Δq
Δq = J†(q_i) · F(q_i)
```

Where:

* `J†(q_i)` is the **Moore-Penrose pseudo-inverse** of the Jacobian matrix at `q_i`.
* `F(q_i)` is the error vector at iteration `i`.

---

## 🛠️ 4. Step-by-Step Newton-Raphson IK Algorithm

### Step 1: Initialization

Choose an initial joint configuration guess: `q₀`.

### Step 2: Compute Forward Kinematics

Use **DH parameters** to compute the transformation matrix for the current pose:

* Extract position: `P_current`
* Extract orientation matrix: `R_current`

### Step 3: Compute Error

#### Position Error:

```text
e_p = P_desired - P_current
```

#### Orientation Error:

One option using rotation matrices:

```text
e_o ≈ 0.5 * (R_current × R_desired)   (vector form or skew-symmetric representation)
```

Alternatively, use:

* **Rotation vector**
* **Axis-angle representation**
* **Logarithmic map**

#### Total Error Vector:

```text
e = [ e_p
      e_o ]
```

### Step 4: Compute Jacobian Matrix

Use the geometric Jacobian derived from forward kinematics:

```text
J = [ J_v
      J_w ]
```

* `J_v`: Jacobian for linear velocity
* `J_w`: Jacobian for angular velocity

### Step 5: Solve for Joint Update

```text
Δq = J† · e
q = q + Δq
```

### Step 6: Repeat Until Convergence

Continue iterations until:

```text
‖e‖ < tolerance
```

Or a maximum number of iterations is reached.

---

## ✅ Summary

The Newton-Raphson method provides:

* A flexible and robust way to solve IK when analytical solutions are impractical.
* Iterative updates that converge to an accurate solution under proper conditions.
* A foundation for more advanced methods like damped least squares and optimization-based IK.

---
```
