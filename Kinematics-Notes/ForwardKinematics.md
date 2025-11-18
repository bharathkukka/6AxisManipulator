# Forward Kinematics - Robotic Arm

## Transformation Matrices

### T01
```
[cos(th1), -sin(th1),  0,   0]
[     0   ,     0    , -1, -d1]
[sin(th1),  cos(th1),  0,   0]
[     0   ,     0    ,  0,   1]
```

### T12
```
[cos(th2), -sin(th2), 0, a1]
[sin(th2),  cos(th2), 0,  0]
[     0  ,      0   , 1,  0]
[     0  ,      0   , 0,  1]
```

### T23
```
[cos(th3), -sin(th3), 0, a2]
[sin(th3),  cos(th3), 0,  0]
[     0  ,      0   , 1,  0]
[     0  ,      0   , 0,  1]
```

### T34
```
[cos(th4), -sin(th4),  0,  a3]
[     0  ,      0   , -1, -d2]
[sin(th4),  cos(th4),  0,   0]
[     0  ,      0   ,  0,   1]
```

### T45
```
[ cos(th5), -sin(th5), 0,  0]
[      0  ,      0   , 1, d3]
[-sin(th5), -cos(th5), 0,  0]
[      0  ,      0   , 0,  1]
```

### T56
```
[ cos(th6), -sin(th6), 0,  0]
[      0  ,      0   , 1,  0]
[-sin(th6), -cos(th6), 0,  0]
[      0  ,      0   , 0,  1]
```

---

## End Effector Transformation Matrix (T0E)
```
T0E =

[ -cos(th6)*(s123*sin(th5) - c123*cos(th4)*cos(th5)) - sin(th6)*(s123*cos(th5) + c123*cos(th4)*sin(th5)),  
   sin(th6)*(s123*sin(th5) - c123*cos(th4)*cos(th5)) - cos(th6)*(s123*cos(th5) + c123*cos(th4)*sin(th5)),  
  -c123*sin(th4),  
   a1*cos(th1) + a2*cos(th1 + th2) + a3*c123 + d2*s123 - d3*c123*sin(th4) - d4*c123*sin(th4) ],

[ -cos(th5 + th6)*sin(th4),  
   sin(th5 + th6)*sin(th4),  
  -cos(th4),  
  -d1 - d3*cos(th4) - d4*cos(th4) ],

[  cos(th6)*(c123*sin(th5) + s123*cos(th4)*cos(th5)) + sin(th6)*(c123*cos(th5) - s123*cos(th4)*sin(th5)),  
   cos(th6)*(c123*cos(th5) - s123*cos(th4)*sin(th5)) - sin(th6)*(c123*sin(th5) + s123*cos(th4)*cos(th5)),  
  -s123*sin(th4),  
   a1*sin(th1) + a2*sin(th1 + th2) + a3*s123 - d2*c123 - d3*s123*sin(th4) - d4*s123*sin(th4) ],

[ 0, 0, 0, 1 ]

Where:
  - s123 = sin(th1 + th2 + th3)
  - c123 = cos(th1 + th2 + th3)
```

---

## Position Vector (P)
```
P = [
  a1*cos(th1) + a2*cos(th1 + th2) + a3*cos(th1 + th2 + th3) + d2*sin(th1 + th2 + th3)
    - d3*cos(th1 + th2 + th3)*sin(th4) - d4*cos(th1 + th2 + th3)*sin(th4),

  -d1 - d3*cos(th4) - d4*cos(th4),

  a1*sin(th1) + a2*sin(th1 + th2) + a3*sin(th1 + th2 + th3) - d2*cos(th1 + th2 + th3)
    - d3*sin(th1 + th2 + th3)*sin(th4) - d4*sin(th1 + th2 + th3)*sin(th4)
]
```

---

## Orientation Vectors

### Normal Vector (XN Axis) - n
```
n = [
  -cos(th6)*(s123*sin(th5) - c123*cos(th4)*cos(th5)) - sin(th6)*(s123*cos(th5) + c123*cos(th4)*sin(th5)),
  -cos(th5 + th6)*sin(th4),
   cos(th6)*(c123*sin(th5) + s123*cos(th4)*cos(th5)) + sin(th6)*(c123*cos(th5) - s123*cos(th4)*sin(th5))
]
```

### Sliding Vector (YN Axis) - s
```
s = [
   sin(th6)*(s123*sin(th5) - c123*cos(th4)*cos(th5)) - cos(th6)*(s123*cos(th5) + c123*cos(th4)*sin(th5)),
   sin(th5 + th6)*sin(th4),
   cos(th6)*(c123*cos(th5) - s123*cos(th4)*sin(th5)) - sin(th6)*(c123*sin(th5) + s123*cos(th4)*cos(th5))
]
```

### Approach Vector (ZN Axis) - a
```
a = [
  -cos(th1 + th2 + th3)*sin(th4),
  -cos(th4),
  -sin(th1 + th2 + th3)*sin(th4)
]
```

---

## Home Position

When:
```
th1 = 0, th2 = 0, th3 = 0, th4 = 0, th5 = 0, th6 = 0
```

### T0E in Home Position
```
[1, 0,  0,   a1 + a2 + a3]
[0, 0, -1,  -d1 - d3 - d4]
[0, 1,  0,          -d2]
[0, 0,  0,           1 ]
```

### Position Vector (P)
```
P = [
  a1 + a2 + a3,
 -d1 - d3 - d4,
        -d2
]
```

### Orientation Vectors
```
n = [1, 0, 0]
s = [0, 0, 1]
a = [0, -1, 0]
```

---

*Verified using MATLAB Symbolic Math Toolbox (R2024a). All manual calculations match symbolic output.*. 

## ***Robots Reachable WorkSpace***
# [code](https://github.com/bhaarath22/6AxisManipulator/blob/b854e4c5bf50857b7c99eb25d89884c77c3abe43/Matlab/ReachableWorkspace.m)


![ing](https://github.com/bhaarath22/6AxisManipulator/blob/34afa07deb6d9638e5373b5b9a60f6bf56aa62b3/Data/Rworkspace.png)