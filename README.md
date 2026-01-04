# *6-Axis Manipulator*

*Timeline: February 2025 - Present*

<!-- markdownlint-disable MD033 -->

## *Project Overview*

Welcome to my 6-Axis Manipulator project! This is an in-depth analysis of how to build a robotic manipulator from the ground up. I began this project from scratch with emphasis on every part of designing, constructing, and programming the manipulator.

In this repository, you will see everything that I have completed to date, including significant notes, drawings, and technical information provided in the Notes & Basics folder. The intention is to leave a well-documented path for others interested in learning about the design of a 6-axis robotic manipulator.
This project is extension of my previous project [4-Axis Manipulator](https://github.com/bhaarath22/4AxisManipulator.git)

## Table of Contents

- [Linear Diagram](#linear-diagram)
  - [Projection of {6} on {0}](#projection-of-6-on-0)
- [Denavit-Hartenberg (DH) Parameters](#denavit-hartenberg-dh-parameters)
- [Frame Visualization](#frame-visualization)
- [Final Block View](#final-block-view)
- [Kinematics \& Dynamics](#kinematics--dynamics)
  - [FK-Transformation](#fk-transformation)
  - [Inverse Kinematics Newton Raphson Method](#inverse-kinematics-newton-raphson-method)
  - [Velocity Propagation](#velocity-propagation)
- [Robot Visualization](#robot-visualization)
  - [Joint Views](#joint-views)
  - [GUI](#gui)
  - [Workspace (Reachable Volume)](#workspace-reachable-volume)

## Linear Diagram

<img src="https://github.com/bhaarath22/6AxisManipulator/blob/1c44f4b05553427278d6e6f6ebbd0bd7ed504e72/Data/Frame%20arrangement%202.jpeg?raw=1" alt="Free body Diagram" width="420" />

### Projection of {6} on {0}

<img src="https://github.com/bhaarath22/6AxisManipulator/blob/8ab5424e95ddc74ad68448610bd8e0c1f5eb9b1b/Data/Frame%20arrangement.jpeg?raw=1" alt="Position" width="420" />

## Denavit-Hartenberg (DH) Parameters

| Link Length (a<sub>i</sub>) | Link Twist (α<sub>i</sub>) | Joint Offset (d<sub>i</sub>) | Joint Angle (θ<sub>i</sub>) |
|-----------------------------|-----------------------------|------------------------------|-----------------------------|
| 0                           | π/2                         | d<sub>1</sub>                | θ<sub>1</sub>               |
| a<sub>1</sub>               | 0                           | 0                            | θ<sub>2</sub>               |
| a<sub>2</sub>               | 0                           | 0                            | θ<sub>3</sub>               |
| a<sub>3</sub>               | π/2                         | d<sub>2</sub>                | θ<sub>4</sub>               |
| 0                           | -π/2                        | d<sub>3</sub>                | θ<sub>5</sub>               |
| 0                           | 0                           | d<sub>4</sub>                | θ<sub>6</sub>               |

## Frame Visualization

***[Here](/0-MATLAB/Frame-Visualization)***

<img src="0-MATLAB/Frame-Visualization/SAM-Frames/Base.png" alt="Base Frame" width="420" />

## Final Block View

<img src="0-MATLAB/Frame-Visualization/SAM-Frames/main-block.png" alt="Main Block View" width="420" />

## Kinematics & Dynamics

***[Here](/0-MATLAB/Kinematics-Dynamics)***

### FK-Transformation

<img src="0-MATLAB/Kinematics-Dynamics/Data/FK-Transformation.png" alt="FK Transformation" width="420" />
<img src="0-MATLAB/Kinematics-Dynamics/Data/FK-Trans1.png" alt="FK Transformation Step 1" width="420" />
<img src="0-MATLAB/Kinematics-Dynamics/Data/FK-Trans2.png" alt="FK Transformation Step 2" width="420" />

### Inverse Kinematics Newton Raphson Method

<img src="0-MATLAB/Kinematics-Dynamics/Data/IK-NR.png" alt="IK Newton Raphson" width="420" />
<img src="0-MATLAB/Kinematics-Dynamics/Data/IK-NR2.png" alt="IK Newton Raphson 2" width="420" />

### Velocity Propagation

<img src="/0-MATLAB/Kinematics-Dynamics/Data/VelocityPropagation.png" alt="Velocity Propagation" width="420" />
<img src="/0-MATLAB/Kinematics-Dynamics/Data/VP3.png" alt="Velocity Propagation 3" width="420" />

## Robot Visualization

***[Here](/0-MATLAB/Robot-Visualization)***

### Joint Views

<img src="0-MATLAB/Robot-Visualization/RobotJointVis/JointVis2.png" alt="Joint Visualization" width="420" />
<img src="0-MATLAB/Robot-Visualization/RobotJointVis/JointPos.png" alt="Joint Position" width="420" />    

### ***watch video***
[watch Video](https://drive.google.com/file/d/1tP6kaBXAC3IijLJ2Su2ogRSXueVRD3ka/view?usp=sharing)

### GUI

<img src="0-MATLAB/Robot-Visualization/RobotJointVis/GUI.png" alt="GUI" width="420" />

### Workspace (Reachable Volume)

<img src="0-MATLAB/Robot-Visualization/RobotJointVis/workspace4.png" alt="Workspace" width="420" />
