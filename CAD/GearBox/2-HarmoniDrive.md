### I. Introduction and Definition

A **strain wave gear**, also commonly known by the brand name **Harmonic Drive** (trademarked by the Harmonic Drive Company), is a unique type of mechanical gearing system. It was invented in **1957 by Steve Walton Master**.

**Key Characteristics**:
*   **Very high reduction ratios** in a compact and lightweight package compared to traditional gearing systems like helical or planetary gears. It can achieve reduction ratios of **up to 30 times in the same space**.
*   **Zero backlash characteristic**.
*   **High torque accuracy and reliability**.
---
### II. Applications

Due to its unique characteristics, this gearing system is used in a wide range of applications, including:
*   Robotics
*   Aerospace
*   Medical machines
*   Milling machines
*   Manufacturing equipment
---  
### III. Key Components and Design

A Harmonic Drive has **three key components**:

1.  **Wave Generator**:
    *   Has an **elliptical shape**.
    *   Consists of an elliptical hub and a special thin-walled bearing that follows the elliptical shape of the hub.
    *   This is the **input of the gear set** and is connected to the motor shaft. As it rotates, it generates a wave motion.
    *   **3D Printed Design Adaptation**: For 3D printing, the special thin-walled bearing is replaced with **normal ball bearings arranged around the circumference of an ellipse**. The major axis radius of the ellipse should be 1.25 millimeters bigger than the inner wall radius of the Flex Plane, and the minor axis radius 1.25 millimeters smaller. The wave generator is typically made of two sections to easily attach the bearings, with one section featuring a shaft coupler for a motor like a NEMA 17 stepper motor.

2.  **Flex Spline (or Flex Plane)**:
    *   Has the form of a **cylindrical cup**.
    *   Made from **flexible but torsionally stiff alloy steel material**.
    *   The sides of the cup are very thin, while the bottom is thick and rigid. This design allows the open end to be flexible and the closed end to be rigid, which can be used as an **output** by connecting an output flange to it.
    *   Has **external teeth** on the open end of the cup.

3.  **Circular Spline**:
    *   A **rigid ring with teeth on the inside**.
    *   The **circular spline has two more teeth than the Flex Spline**. This tooth count difference is a key design aspect of the strain wave gear system.
---  
### IV. Working Principle

1.  **Insertion and Deformation**: The wave generator is inserted into the Flex Spline, causing the Flex Spline to take the elliptical shape of the wave generator.
2.  **Meshing**: The wave generator and the deformed Flex Spline are then placed inside the circular spline. Due to the elliptical shape of the Flex Spline, its teeth mesh with the internal teeth of the circular spline **only in two regions** on opposite sides, across the major axis of the wave generator ellipse.
3.  **Wave Motion and Rotation**: As the wave generator rotates, it radially deforms the open end of the Flex Spline, causing the teeth meshing regions to slowly change position.
4.  **Tooth Count Difference and Backward Movement**: Because the Flex Spline has two fewer teeth than the circular spline, for every 180 degrees (half) rotation of the wave generator, the Flex Spline's teeth meshing with the circular spline will advance by only **one tooth**. This results in the Flex Spline rotating a small amount **backward** relative to the wave generator. For a full 360-degree rotation of the wave generator, the Flex Spline will advance by **two teeth**.

### V. Reduction Ratio Calculation

The reduction ratio can be easily calculated using the following formula:
**Ratio = (Flex Spline Teeth - Circular Spline Teeth) / Flex Spline Teeth**

*   **Example**: If the Flex Spline has 200 teeth and the Circular Spline has 202 teeth (two more), the reduction ratio is (200 - 202) / 200 = -0.01.
*   This translates to **1/100th the speed of the wave generator**.
*   The **minus sign indicates that the output is in the opposite direction**.
*   Different reduction ratios can be achieved by changing the number of teeth, either by altering the mechanism diameter with the same size teeth, or by changing the teeth size while preserving the gear set's size and weight.
---  
### VI. Design for 3D Printing

*   **CAD Software**: Fusion 360 was used to design the model, with all parts designed to be 3D printable.
*   **Gear Module and Teeth Count**:
    *   The **module of the gears** (size of the teeth) was chosen to be **1.25**.
    *   The **circular spline** was designed with **72 teeth**.
    *   The **Flex Spline** (Flex Plane) was designed with **70 teeth** (two fewer than the circular spline).
    *   This combination results in a **35:1 reduction ratio** while maintaining a relatively small gear set size.
*   **Backlash Consideration**: 3D printed parts might not achieve true zero backlash due to printer limitations in accuracy and precision. Fine-tuning settings like horizontal expansion is crucial.
---  
### VII. 3D Printing and Assembly Considerations

*   **Slicing Software Settings**:
    *   The **horizontal expansion** feature in slicing software is crucial for accurate dimensions.
    *   A setting of **-0.15 millimeters** for horizontal expansion was found to give relatively decent accuracy for the prints. Without this feature, prints can be slightly larger, preventing proper meshing. This value might vary per printer and requires testing.

*   **Printer Used**: A Creality CR-10 3D printer was used for printing all parts.

*   **Assembly Parts**: Besides 3D printed parts, bolts, nuts, and bearings are required.
    *   Bearings for the output side: Two bearings with 47mm outer diameter and 35mm inner diameter are inserted into the housing, secured with M4 countersunk bolts and washers.
    *   Distance rings (1.5mm thick) can be placed between bearings.
    *   M4 bolts and nuts are used to attach the output flange to the Flex Spline.
    *   M3 nuts are used in the wave generator for securing it to the motor shaft with grub screws.
    *   10 bearings are inserted into the wave generator.
    *   M3 bolts (16mm long) and nuts secure the wave generator bearings.

*   **Assembly Steps**:
    1.  Insert output bearings into the housing.
    2.  Attach the output flange to the Flex Spline using bolts.
    3.  Insert the Flex Spline through the bearing.
    4.  Assemble the output shaft by placing M4 nuts in slots and securing additional parts.
    5.  Assemble the wave generator by inserting M3 nuts and the 10 bearings, then securing them with bolts and nuts.
    6.  Attach the motor (NEMA 17 stepper motor) to the motor mount and the lid of the gear set.
    7.  Insert the wave generator into the Flex Spline, maintaining a 2mm distance from the motor lid using washers as guides, then tighten grub screws to secure it to the motor shaft.
    8.  Finally, insert M4 nuts into housing sockets and secure both the circular spline and the wave generator to the housing along with the lid.

*   **Visual Enhancement**: The 3D printed lid can be replaced with an acrylic one to see the internal workings.

### VIII. Performance Tests

*   **Operation**: The assembled gearbox, with a 35:1 reduction ratio, showed the output shaft rotating 35 times slower than the input shaft.
*   **Smoothness**: The motion can sometimes be "jittery". This was attributed to the motor not being mounted perfectly in the center, especially when using a hand-made acrylic motor mount. Using the original 3D printed motor mount resulted in smoother movement.
*   **Backlash**:
    *   While strain wave gears are known for zero backlash, the 3D printed model showed **noticeable backlash**.
    *   This is primarily due to the **limitations of 3D printers** in achieving perfectly accurate and precise dimensions and tooth profiles.
    *   Even slight inaccuracies (e.g., 0.18 mm thickness from insulating tape on the Flex Spline inner wall) can significantly improve results, suggesting that **testing and fine-tuning print settings** are crucial.
*   **Torque Test**:
    *   The gearbox was able to lift **1.25 kilograms at a distance of 25 centimeters**.
    *   This translates to a torque of around **3 Newton-meters**.
    *   This is **at least 10 times greater** than the rated torque of a NEMA 17 stepper motor (typically around 28 Newton-centimeters or 0.28 Newton-meters).
    *   The efficiency was not directly stated but can be inferred as less than ideal; a 35:1 ratio would ideally provide 35 times the torque.
