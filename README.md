# 6-Axis Manipulator

*Timeline: February 2025 - Present*

## Project Overview

Welcome to my 6-Axis Manipulator project! This is an in-depth analysis of how to build a robotic manipulator from the ground up. I began this project from scratch with emphasis on every part of designing, constructing, and programming the manipulator.

In this repository, you will see everything that I have completed to date, including significant notes, drawings, and technical information provided in the Notes & Basics folder. The intention is to leave a well-documented path for others interested in learning about the design of a 6-axis robotic manipulator.
This project is extension of my previous project [4-Axis Manipulator](https://github.com/bhaarath22/4AxisManipulator.git)

## Table of Contents
- [6-Axis Manipulator](#6-axis-manipulator)
  - [Project Overview](#project-overview)
  - [Table of Contents](#table-of-contents)
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

![Free body Diagram](https://github.com/bhaarath22/6AxisManipulator/blob/1c44f4b05553427278d6e6f6ebbd0bd7ed504e72/Data/Frame%20arrangement%202.jpeg)

### Projection of {6} on {0}

![Position](https://github.com/bhaarath22/6AxisManipulator/blob/8ab5424e95ddc74ad68448610bd8e0c1f5eb9b1b/Data/Frame%20arrangement.jpeg)

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

![Base](0-MATLAB/Frame-Visualization/SAM-Frames/Base.png)

## Final Block View

![Block View](0-MATLAB/Frame-Visualization/SAM-Frames/main-block.png)

## Kinematics & Dynamics

***[Here](/0-MATLAB/Kinematics-Dynamics)***

### FK-Transformation

![FK-Transformation.png](0-MATLAB/Kinematics-Dynamics/Data/FK-Transformation.png)
![FK-Trans1.png](0-MATLAB/Kinematics-Dynamics/Data/FK-Trans1.png)
![FK-Trans2.png](0-MATLAB/Kinematics-Dynamics/Data/FK-Trans2.png)

### Inverse Kinematics Newton Raphson Method

![IK-NR.png](0-MATLAB/Kinematics-Dynamics/Data/IK-NR.png)
![IK-NR2.png](0-MATLAB/Kinematics-Dynamics/Data/IK-NR2.png)

### Velocity Propagation

![VelocityPropagation.png](/0-MATLAB/Kinematics-Dynamics/Data/VelocityPropagation.png)
![VP3.png](/0-MATLAB/Kinematics-Dynamics/Data/VP3.png)

## Robot Visualization

***[Here](/0-MATLAB/Robot-Visualization)***

### Joint Views

![Joint Visualization 1](0-MATLAB/Robot-Visualization/RobotJointVis/Jointvis1.png)
![Joint Visualization 2](0-MATLAB/Robot-Visualization/RobotJointVis/JointVis2.png)
![Joint Position](0-MATLAB/Robot-Visualization/RobotJointVis/JointPos.png)

### GUI

![GUI](0-MATLAB/Robot-Visualization/RobotJointVis/GUI.png)

### Workspace (Reachable Volume)

![Workspace 4](0-MATLAB/Robot-Visualization/RobotJointVis/workspace4.png)
