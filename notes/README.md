Newton-Raphson Iteration
Computes the error in position and orientation.
Uses Jacobian pseudo-inverse to update joint angles.
Iterates until error is below tolerance.
Forward Kinematics & Jacobian Computation
Uses Denavit-Hartenberg (DH) parameters to compute transformation matrices.
Extracts position and rotation matrix.
Computes Jacobian matrix for velocity and angular velocity.

🧠 1. Introduction to Inverse Kinematics (IK)

Inverse Kinematics (IK) involves calculating the joint parameters (angles, positions) needed to place the end-effector of a robotic manipulator at a desired pose (position + orientation) in space.
For a robot with:
n joints (DOF),
known forward kinematics: T = f(q) (a function from joint angles q to end-effector pose),
the goal is to solve for q such that f(q) = desired_pose.
🔁 2. Why Use Numerical Methods Like Newton-Raphson?

In most real-world robots:
Analytical IK is hard (or impossible) due to nonlinear and coupled equations.
Newton-Raphson provides a powerful iterative method for approximating the solution.
🧮 3. Newton-Raphson Method Overview

The method solves nonlinear equations of the form:
F
(
q
)
=
0
F(q)=0
Where:
F(q) is the error between current pose and desired pose.
We want to find q such that this error goes to zero.
At each iteration:
q
i
+
1
=
q
i
+
Δ
q
q 
i+1
​	
 =q 
i
​	
 +Δq
Where:
Δ
q
=
J
†
(
q
i
)
⋅
F
(
q
i
)
Δq=J 
†
 (q 
i
​	
 )⋅F(q 
i
​	
 )
J
†
J 
†
 : Moore-Penrose pseudo-inverse of Jacobian matrix.
F
(
q
i
)
F(q 
i
​	
 ): current error vector (position + orientation).
🛠️ 4. Step-by-Step Newton-Raphson IK Algorithm

Step 1: Initialization
Choose initial guess q₀.
Step 2: Compute Forward Kinematics
Use DH parameters to compute the current end-effector pose: P_current, R_current.
Step 3: Compute Error
Position error:
e
p
=
P
desired
−
P
current
e 
p
​	
 =P 
desired
​	
 −P 
current
​	
 
Orientation error:
e
o
=
1
2
(
R
current
×
R
desired
)
e 
o
​	
 = 
2
1
​	
 (R 
current
​	
 ×R 
desired
​	
 )
or use rotation vector/axis-angle/logarithmic map.
Stack errors:
e
=
[
e
p
e
o
 
]
e=[ 
e 
p
​	
 
e 
o
​	
 
​	
 ]
Step 4: Compute Jacobian Matrix J(q)
Use forward kinematics to compute geometric Jacobian: 
J
=
[
J
v
J
w
 
]
J=[ 
J 
v
​	
 
J 
w
​	
 
​	
 ]
Step 5: Update Joint Values
Solve:
Δ
q
=
J
†
⋅
e
Δq=J 
†
 ⋅e
Update:
q
=
q
+
Δ
q
q=q+Δq
Step 6: Repeat
Until:
∥
e
∥
<
tolerance
∥e∥<tolerance
or max iterations reached.
