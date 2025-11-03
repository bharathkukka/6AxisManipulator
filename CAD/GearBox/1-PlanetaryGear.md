# Planetary Gearbox Design for 6-Axis Manipulator

---

## Overview
A planetary gearbox is a compact, high-torque, and efficient gear system widely used in robotics, automation, and industrial machinery. For my 6-axis manipulator, I designed and built a custom two-stage planetary gearbox to achieve a 16:1 reduction ratio, balancing precision, durability, and manufacturability.

---

## Key Features & Applications
- **High torque density**
- **Compact design**
- **High efficiency**
- **Used in:** Robots, industrial machines, medical devices, wind turbines, automatic transmissions

---

## Main Components
- **Sun Gear:** Central input gear
- **Planet Gears:** Orbit around the sun gear
- **Ring Gear:** Internal toothed gear guiding planet gears
- **Carrier:** Connects planet gears, outputs combined motion

---

## Working Principles & Transmission Ratios
- **Versatility:** Output ratio depends on which component is stationary/input/output
- **Common Configurations:**
  - Sun input, ring stationary, carrier output (**speed reduction & torque increase**)
  - Carrier input, sun output (**speed increase**)
  - Carrier stationary, sun input, ring output (**reverse direction**)
  - Sun stationary, ring input, carrier output (**slower output**)
- **Automatic Transmissions:** Multiple planetary sets, clutches select stationary components
- **Ratio Formula:** `1 + (ring gear teeth / sun gear teeth)`

---

## My Design: 16:1 Reduction Ratio
- **Goal:** ~15:1 reduction (rounded to 16:1)
- **Method:** Two-stage gearbox (each stage 4:1)
- **Gear Teeth Selection:**
  - Sun: 15 teeth
  - Planet: 15 teeth
  - Ring: 45 teeth
- **Ratio Calculation:**
  - Each stage: 4:1 (ring = 3 × sun)
  - Final: 4 × 4 = 16:1
- **Spacing Rule:** `(Sun + Ring) / Number of Planets = whole number` (for balanced load)
- **Wear Consideration:** Ideally use prime/co-prime teeth counts for even wear (not implemented for simplicity)

---

## CAD & Gear Generation
- **Software:** Onshape (cloud-native, real-time collaboration)
- **Gear Generation:** Spur gear feature script
- **Parameters:** Module 1.5, teeth counts as above
- **Helical Gears:** Opposite helix directions for meshing
- **Backlash:** 0.1 mm for 3D printing tolerance
- **Ring Gear:** Created via Boolean subtraction
- **Carrier:** Designed for double-sided shaft support
- **Download Example CAD Design:** [Planetary Gearbox STL Files](https://howtomechatronics.com/download/planetary-gearbox-stl-files/)
---

## 3D Printing Tips
- **Slicing Settings:**
  - Horizontal expansion: -0.02 mm
  - Hole horizontal expansion: 0.04 mm
  - Test prints recommended for best fit

---

## Assembly Steps
1. **Planet Carrier:**
   - Two sections, M3 bolts, threaded inserts
   - 6mm shafts, bushings, M6 washers
   - Bearings for sun gear/input shaft (insert before final assembly)
2. **First Stage:**
   - Insert input shaft and carrier into ring gear housing
3. **Second Stage:**
   - Assemble similarly, insert into housing
4. **Housing:**
   - Add threaded inserts for covers
5. **Lubrication:**
   - Apply to gears
6. **Covers:**
   - Install bearings, secure covers with M3 bolts
7. **Motor Attachment:**
   - Mounting plate, grab screw, secure motor shaft

---

## Performance & Testing
- **Smooth Operation:** Minimal backlash, output 16× slower than input
- **Backlash:**
  - Initial: <0.01 mm at 10 cm
  - Loaded: ~0.3° (18 arc minutes)
- **Torque:**
  - Max: 200 N·cm (20 N at 10 cm)
  - Motor alone: 28 N·cm
  - Gearbox: ~7–8× torque increase (50% efficiency)
- **Efficiency:**
  - Lower due to friction, tight fit, bushings
  - Can improve with looser fit (but increases backlash)

---

## Summary Table
| Parameter         | Value                |
|------------------|----------------------|
| Stages           | 2                    |
| Ratio per stage  | 4:1                  |
| Total Ratio      | 16:1                 |
| Sun/Planet Teeth | 15                   |
| Ring Teeth       | 45                   |
| Module           | 1.5                  |
| Motor            | Nema 17 Stepper      |
| Max Torque       | 200 N·cm             |
| Backlash         | ~18 arc minutes      |
| Efficiency       | ~50%                 |

---

*For more details, see the CAD files and assembly photos in the project repository.*
