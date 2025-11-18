
## *Linear Diagram*

![Free body Diagram](https://github.com/bhaarath22/6AxisManipulator/blob/1c44f4b05553427278d6e6f6ebbd0bd7ed504e72/Data/Frame%20arrangement%202.jpeg)
  ## *Projection of {6} on {0}*
![Position](https://github.com/bhaarath22/6AxisManipulator/blob/8ab5424e95ddc74ad68448610bd8e0c1f5eb9b1b/Data/Frame%20arrangement.jpeg)


# **Denavit-Hartenberg**(DH) parameters

| Link Length (a<sub>i</sub>) | Link Twist (α<sub>i</sub>) | Joint Offset (d<sub>i</sub>) | Joint Angle (θ<sub>i</sub>) |
|--------------------|-------------------|-------------------|-----------------|
| 0                |  π/2                 | d<sub>1</sub>     | θ<sub>1</sub> |
| a<sub>1</sub>    |0       | 0                 | θ<sub>2</sub> |
| a<sub>2</sub>    | 0                 | 0                 | θ<sub>3</sub> |
| a<sub>3</sub>    | π/2                | d<sub>2</sub>                 | θ<sub>4</sub> |
| 0    | -π/2            | d<sub>3</sub>     | θ<sub>5</sub> |
| 0                | 0            | d<sub>4</sub>     | θ<sub>6</sub> |

------
## **Visualization of the Co-ordinate Frames**
I used MATLAB (Robotics System Toolbox, Version 24.1, R2024a) to visualize the coordinate frames. This helped me view the joint axes in 3D and verify the correctness of my DH parameters. [code](https://github.com/bhaarath22/6AxisManipulator/blob/6a545a6a93bf74ffca8c1d71b9901aa56932cfdb/Matlab/Visualisation-Co-ordinate-Frame.m)

![out](https://github.com/bhaarath22/6AxisManipulator/blob/a0188b56417b50737ff09bc6f44f96b29cec6c82/Data/FA-Matlab-Final.png)
----







 

