# Harmonic Drive (Strain Wave Gear)

---

## I. Introduction & Definition

A **strain wave gear** (commonly known as **Harmonic Drive**) is a unique mechanical gearing system invented in **1957 by Steve Walton Master**.

**Key Characteristics:**
- **Very high reduction ratios** in a compact, lightweight package (up to 30x in the same space as traditional gears)
- **Zero backlash**
- **High torque accuracy & reliability**

---

## STL Files for Harmonic Drive

You can download ready-to-print STL files for the Harmonic Drive from [HowToMechatronics](https://howtomechatronics.com/download/harmonic-drive-stl-files/).

---

## II. Applications

Used in:
- **Robotics**
- **Aerospace**
- **Medical machines**
- **Milling & manufacturing equipment**

---

## III. Key Components & Design

A Harmonic Drive consists of **three main components**:

| Component         | Description                                                                                 |
|------------------|--------------------------------------------------------------------------------------------|
| **Wave Generator** | Elliptical input hub with ball bearings (for 3D printing), creates wave motion              |
| **Flex Spline**    | Thin-walled, flexible cylindrical cup with external teeth; output side                      |
| **Circular Spline**| Rigid ring with internal teeth; has two more teeth than Flex Spline                        |

**3D Printing Adaptation:**
- Ball bearings replace thin-walled bearing in wave generator
- Major axis radius: **+1.25 mm** vs. Flex Plane inner wall
- Minor axis radius: **-1.25 mm** vs. Flex Plane inner wall
- Wave generator: two sections, one with shaft coupler (e.g., NEMA 17 stepper motor)

---

## IV. Working Principle

1. **Insertion & Deformation:** Wave generator inserted into Flex Spline, deforming it elliptically
2. **Meshing:** Flex Spline (deformed) placed inside Circular Spline; teeth mesh in two regions (major axis)
3. **Wave Motion:** Rotating wave generator moves meshing regions
4. **Tooth Count Difference:** For every 180° rotation, Flex Spline advances by one tooth (backward relative to input)
5. **Output:** For 360° rotation, Flex Spline advances by two teeth

---

## V. Reduction Ratio Calculation

**Formula:**
```
Ratio = (Flex Spline Teeth - Circular Spline Teeth) / Flex Spline Teeth
```

**Example:**
- Flex Spline: **200 teeth**
- Circular Spline: **202 teeth**
- Ratio: (200 - 202) / 200 = **-0.01** (output is 1/100th speed, opposite direction)

**Design Example:**
- Gear module: **1.25**
- Circular Spline: **72 teeth**
- Flex Spline: **70 teeth**
- Ratio: **35:1**

---

## VI. Design for 3D Printing

- **CAD Software:** Fusion 360
- **Backlash:** 3D printed parts may not achieve zero backlash; fine-tune horizontal expansion

---

## VII. 3D Printing & Assembly Considerations

**Slicing Settings:**
- Horizontal expansion: **-0.15 mm** (may vary by printer)

**Printer:** Creality CR-10

**Required Parts:**
- Bearings (output): 2 × 47mm OD, 35mm ID
- Distance rings: 1.5mm thick
- M4 bolts/nuts (output flange)
- M3 nuts (wave generator)
- 10 bearings (wave generator)
- M3 bolts (16mm) & nuts (wave generator)

**Assembly Steps:**
1. Insert output bearings into housing
2. Attach output flange to Flex Spline
3. Insert Flex Spline through bearing
4. Assemble output shaft (M4 nuts in slots)
5. Assemble wave generator (insert M3 nuts & bearings, secure with bolts)
6. Attach motor to mount & lid
7. Insert wave generator into Flex Spline (2mm distance from lid), tighten grub screws
8. Secure circular spline & wave generator to housing with lid

**Visual Enhancement:**
- Use acrylic lid for internal visibility

---

## VIII. Performance Tests

| Test         | Result/Observation                                                                 |
|--------------|------------------------------------------------------------------------------------|
| **Operation**| Output shaft rotates **35x slower** than input shaft                               |
| **Smoothness**| Jittery motion if motor not centered; smoother with original 3D printed mount      |
| **Backlash** | Noticeable due to 3D printer limitations; fine-tuning (e.g., tape) improves result |
| **Torque**   | Lifted **1.25 kg at 25 cm** (≈3 Nm torque, 10x NEMA 17 rating)                     |
| **Efficiency**| Less than ideal; 35:1 ratio should provide 35x torque                             |

---
