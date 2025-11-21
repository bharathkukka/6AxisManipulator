# 6-Axis Manipulator – MATLAB Workspace

Comprehensive MATLAB environment for a 6-DOF serial manipulator (revolute joints) covering forward/inverse kinematics, velocity/Jacobian derivations, visualization (frames, solid link blocks, GUI), reachable workspace sampling, and experimental scripts.  

> DH Convention used throughout: `[a_{i-1}, α_{i-1}, d_i, θ_i]` (Standard DH). Units: meters unless explicitly noted (some visualization block radii currently in mm-like scale).

---
## Frame-Visualization 

### ***[here](Frame-Visualization)***

<!-- markdownlint-disable MD033 -->

<img src="Frame-Visualization/SAM-Frames/Base.png" alt="Base" width="420" />


 <img src="Frame-Visualization/SAM-Frames/EndEffector.png" alt="EndEffector" width="420" />
 
---
<img src="Frame-Visualization/SAM-Frames/blockSAM.png" alt="Block Model" width="420" /> 

 <img src="Frame-Visualization/SAM-Frames/main-block.png" alt="Main Block" width="420" />

---

## Kinematics-Dynamics

### ***[here](Kinematics-Dynamics)***

## Forward Kinematics
<img src="Kinematics-Dynamics/Data/FK-Transformation.png" alt="FK Transformation" width="420" />

<img src="Kinematics-Dynamics/Data/FK-Trans2.png" alt="FK Trans 2" width="420" />

---

## Inverse Kinematics
<img src="Kinematics-Dynamics/Data/IK-NR.png" alt="IK NR" width="420" />  
<img src="Kinematics-Dynamics/Data/IK-NR2.png" alt="IK NR2" width="420" />

---

## Velocity Propagation
<img src="Kinematics-Dynamics/Data/VelocityPropagation.png" alt="Velocity Propagation" width="420" />

<img src="Kinematics-Dynamics/Data/VP3.png" alt="VP3" width="420" />

## Robot-Visualization.
### ***[here](Robot-Visualization)***

<img src="Robot-Visualization/RobotJointVis/JointPos.png" alt="JointPos" width="420" />
[Vidoe](https://drive.google.com/file/d/1tP6kaBXAC3IijLJ2Su2ogRSXueVRD3ka/view?usp=sharing)

<img src="Robot-Visualization/RobotJointVis/JointVis2.png" alt="JointVis2" width="420" />
## GUI 
<img src="Robot-Visualization/RobotJointVis/GUI.png" alt="GUI" width="420" />

## Workspace
<img src="Robot-Visualization/RobotJointVis/workspace3.png" alt="Workspace3" width="420" />

<img src="Robot-Visualization/RobotJointVis/workspace4.png" alt="Workspace4" width="420" />


### Key Scripts

* `SAM_Vis_Frames.m` – Defines DH in meters, builds a `rigidBodyTree` (`DataFormat='column'`), shows the robot, then calls `smimport(myRobot)` to auto-generate a Simscape model diagram.
* `SAM_Visualization_Frames.m` – Creates same chain (`DataFormat='row'`), focuses on clean frame visualization (camera zoom, axis limits, axis off, grid on). Good for validating DH orientation.
* `SAM_Visualization_Blocks.m` – Adds cylindrical visuals (`addVisual`) per link for presentation-style rendering. Radii/lengths presently look closer to mm scale; normalize if needed.


* `FK_TransformationMat.m` – Builds symbolic Aᵢ matrices from DH table, multiplies to get `T0E`. Outputs intermediate transforms (`T01`, `T12`, ...), end-effector pose, position vector `P`, and orientation axes (n, s, a).
* `IKNewtonRapson.m` – Newton–Raphson inverse kinematics: iteratively updates joint vector `q_{k+1} = q_k + pinv(J) * error` using position + orientation error (orientation from cross products of current vs desired axes). Adjustable tolerance `tol`, iteration limit `max_iters`.
* `VelocityPropagation.m` – Symbolic angular (`w`) and linear (`v`) velocity propagation through each frame; builds Jacobian (linear part `Jv`, angular part `Jw`) via `equationsToMatrix`. Also shows alternative (commented) partial derivative method.




