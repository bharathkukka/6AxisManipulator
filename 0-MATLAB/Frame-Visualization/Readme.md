# 6-Axis Manipulator – MATLAB Frame & Visualization

This folder documents and demonstrates how my 6-DOF manipulator model is constructed and visualized using MATLAB's Robotics System Toolbox. The focus is on kinematic definition (DH parameters) and basic visualization (frames vs solid link approximations) plus optional export to Simscape Multibody.

## Files

| File / Folder | Purpose |
|---------------|---------|
| [`SAM_Vis_Frames.m`](./SAM_Vis_Frames.m) | Builds a `rigidBodyTree` with DH parameters (meters) and calls `smimport` to create a Simscape Multibody model. |
| [`SAM_Visualization_Frames.m`](./SAM_Visualization_Frames.m) | Visualizes the manipulator frames (no custom link visuals) with camera, axis, and view settings. |
| [`SAM_Visualization_Blocks.m`](./SAM_Visualization_Blocks.m) | Adds thicker cylindrical visuals for each link to enhance clarity; units use millimeters (mixed scale). |


## Requirements

* MATLAB (R2023a or later recommended).
* Robotics System Toolbox (required for `rigidBodyTree`, joints, `show`).
* Simscape Multibody (optional – only needed if you use `smimport` in `SAM_Vis_Frames.m`).

## DH Convention

Rows follow `[a alpha d theta]` (standard DH). All joints are revolute. Home pose sets all `theta` to 0. Two scripts use meters; the blocks script currently uses millimeter-scale values. Keep unit consistency if combining.

### Example DH Table (Meters)

| Joint | a (m) | alpha (rad) | d (m) | theta (rad, home) |
|-------|-------|-------------|-------|--------------------|
| 1 | 0    |  pi/2  | 0.06 | 0 |
| 2 | 0.2  | 0      | 0    | 0 |
| 3 | 0.15 | 0      | 0    | 0 |
| 4 | 0.08 |  pi/2  | 0.06 | 0 |
| 5 | 0    | -pi/2  | 0.06 | 0 |
| 6 | 0    | 0      | 0.03 | 0 |

Adjust angles at runtime; link lengths/offsets define structural geometry.

## Script Overview

### `SAM_Vis_Frames.m`

* Defines 6 rows of DH parameters with link lengths (`a1..a3`) and offsets (`d1..d4`).
* Builds the robot with `DataFormat='column'`.
* Calls `show(myRobot)` to visualize.
* Uses `smimport(myRobot)` to generate a Simscape Multibody model (opens a new model with blocks for each rigid body).

![Base Frame Visualization](SAM-Frames/Base.png)

### `SAM_Visualization_Frames.m`

* Creates the same kinematic chain (meters) with `DataFormat='row'`.
* No custom visuals; focuses on frame orientation.
* Sets camera zoom, axis limits, removes axes for clean view, enables grid.
* Good for verifying DH frame alignment.


![End Effector Frame Visualization](SAM-Frames/EndEffector.png)

### `SAM_Visualization_Blocks.m`

* Demonstrates adding cylindrical visuals (`addVisual`) for each link.
* Uses thicker radii to distinguish segments.
* Mixed metric units—treat values as millimeters unless harmonized.
* Useful for presentation-quality static visualization.


![Block Model Visualization](SAM-Frames/blockSAM.png)

![Main Block Assembly](SAM-Frames/main-block.png)

## Usage

1. Open MATLAB and ensure required toolboxes are installed.
2. Set the current folder to `Matlab/Frame-Visualization`.
3. Choose one of the scripts and run:
   * Frames only: run `SAM_Visualization_Frames.m`.
   * Thicker links: run `SAM_Visualization_Blocks.m`.
   * Export to Simscape: run `SAM_Vis_Frames.m` (creates/opens a Simscape model via `smimport`).


## Adjusting Joint Angles

Each script sets home pose joint angles (`theta1` … `theta6` or `th1` … `th6`) to zero. To change:

* Replace zero values with desired angles in radians.
* Re-run the script to see updated configuration.
* For dynamic animation, consider using `homeConfiguration(Robot)` and iterative updates with `show(Robot, config)` inside a loop.

## How It Works (Quick Flow)

1. Each script defines a DH parameter matrix.
2. A `rigidBodyTree` is created (row or column data format).
3. Each link is added with a revolute joint via `setFixedTransform(...,'dh')`.
4. Optional visuals (`addVisual`) approximate link shapes.
5. `show` renders the model; camera/axes tweaked for clarity.
6. `smimport` (in `SAM_Vis_Frames.m`) converts the tree to a Simscape Multibody diagram.

### Get End-Effector Pose

```matlab
config = homeConfiguration(Robot); % or modify joint angles
T_ee = getTransform(Robot, config, Robot.BodyNames{end});
disp(T_ee); % 4x4 homogeneous transform
```

### Simple Joint Animation Example

```matlab
fig = figure; ax = axes(fig);
configs = homeConfiguration(Robot);
for t = linspace(0,2*pi,120)
   configs(2).JointPosition = 0.5*sin(t); % example motion joint 2
   configs(3).JointPosition = 0.3*sin(0.5*t);
   show(Robot, configs, 'Parent', ax, 'PreservePlot', false);
   title(sprintf('Animation t=%.2f', t));
   drawnow;
end
```


Suggested exports:

* Frame-only view (`SAM_Visualization_Frames.m`): robot_frames.png
* Thick link view (`SAM_Visualization_Blocks.m`): robot_blocks.png
* Simscape diagram (after `smimport`): simscape_model.png (screenshot)

## Outputs

Typical generated assets:

| Image | Source Script | Description |
|-------|---------------|-------------|
| robot_frames.png | `SAM_Visualization_Frames.m` | Frame-only view to verify orientation. |
| robot_blocks.png | `SAM_Visualization_Blocks.m` | Thicker link rendering for presentations. |
| simscape_model.png | `SAM_Vis_Frames.m` | Screenshot of Simscape Multibody generated model. |
| end_effector_pose.txt | Any | Saved numeric transform from `getTransform`. |

## Verification Checklist

* Joint Z axes align with intended rotation axes.
* `alpha` values produce correct twists.
* Base frame location matches mechanical mounting reference.
* End-effector pose matches manual DH multiplication.

## Units

Standardize to meters: `value_m = value_mm / 1000`. After converting, check scale with axis limits.

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| `rigidBodyTree` not found | Toolbox missing | Install Robotics System Toolbox. |
| `smimport` undefined | Simscape Multibody missing | Install Simscape Multibody or skip export. |
| Wrong scale | Mixed units | Convert all to meters. |
| Visuals misaligned | Incorrect DH order | Confirm `[a alpha d theta]` entry sequence. |
| Slow animation | Rebuilding figure | Reuse figure; use `show(Robot,'PreservePlot',false)`. |



---
Last updated: 18 Nov 2025

