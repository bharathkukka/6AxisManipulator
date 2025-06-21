### I. Introduction to Planetary Gear Sets

*   A **planetary gear set** is a unique gearing system.

*   **Key Features**: Provides high torque, high efficiency, and has a compact design.

*   **Applications**: Used in countless applications such as industrial machines, agricultural equipment, medical devices, wind turbines, robots, and automatic transmissions.


*   **Main Components**:  
    *   **Sun Gear**: The central gear, usually the input that drives the motor.
    *   **Planet Gears**: Three or more gears that orbit around the sun gear.
    *   **Ring Gear**: The internal toothed gear that determines the orbit of the planet gears.
    *   **Carrier**: Connects the planet gears together and transfers their orbiting motion into a single central axis output; often the output of the gearbox in common scenarios.
---  

### II. Working Principles and Transmission Ratios

*   **Versatility**: The beauty of the planetary gearing system is its ability to produce **various outputs and transmission ratios** depending on which component is held stationary and which is used as the input.

*   **Common Scenarios/Examples**:
    *   **Sun Gear Input, Ring Gear Stationary, Carrier Output**: This is the **most common scenario** for speed reduction and torque increase. The carrier rotates at a reduced speed, for example, 5 times slower (a 5:1 ratio). The highest transmission ratio is achieved in this configuration. The formula for the ratio is 1 + (ring gear teeth number / sun gear teeth number).
    *   **Carrier Input, Sun Gear Output**: The Sun Gear will rotate faster, for example, 5 times faster.
    *   **Carrier Stationary, Sun Gear Input, Ring Gear Output**: The output will be slower and in reverse direction, for example, 4 times slower (a negative 4:1 ratio).
    *   **Sun Gear Stationary, Ring Gear Input, Carrier Output**: The carrier will be slower than the input, for example, 1.25 times slower (a 5:4 ratio).

*   **Automatic Transmissions**: The unique feature of achieving different outputs with the same setup is utilized in automatic transmissions by connecting several planetary gear sets in series. Clutches control which component is held stationary to achieve different output speeds.

*   **Transmission Ratios**: These depend on the gear teeth numbers and can be calculated using specific formulas.
---  
### III. Designing a 16:1 Reduction Ratio Planetary Gearbox

*   **Design Goal**: To design a gearbox with a **reduction ratio of around 15:1** (a whole number).

*   **Multi-Stage Gearbox**: A single-stage planetary gearbox typically provides ratios between 3:1 and 10:1. To achieve a ratio of around 15:1, a **two-stage gearbox** was necessary.
    *   The output of the first stage becomes the input of the second stage.
    *   The final gearbox ratio is the **product of the two gear sets' ratios**.

*   **Chosen Ratios**: Two stages, each with a **4:1 ratio**, resulting in a final 16:1 ratio (4 x 4 = 16).

*   **Gear Teeth Number Selection for 4:1 Ratio**:
    *   According to the formula, for a 4:1 ratio (Sun Gear input, Ring Gear stationary, Carrier output), the ring gear teeth number should be **three times The Sun Gear teeth number**.
    *   Chosen **Ring Gear**: 45 teeth.
    *   Chosen **Sun Gear**: 15 teeth (45/15 = 3; 3+1 = 4 for a 4:1 ratio).
    *   **Planet Gears**: Also 15 teeth.

*   **Rules for Choosing Gear Teeth Numbers for Proper Functioning**:
    1.  **Ring Gear Teeth Number = Sun Gear Teeth Number + (2 x Planet Gear Teeth Number)**: Ensures the Sun and two Planet gears fit inside the ring gear.
    2.  **(Sun Gear Teeth + Ring Gear Teeth) / Number of Planet Gears = A Whole Number**: Ensures equal spacing between planet gears. This is crucial because forces between the Sun and planet gears point towards the Sun Gear. If planets are equally spaced, these forces cancel out, preventing the sun from wobbling, vibrations, and unbalanced load sharing.

*   **Considerations for Gear Wear and Durability**:
    *   Having 15 teeth on the Sun and Planet gears, and 45 on the Ring gear (all multiples of 15) can lead to uneven wear because the same tooth on the Sun Gear will mesh with the same tooth on the Planet gear each rotation.
    *   To avoid this, gear teeth numbers should ideally be **prime or co-prime numbers**. This ensures a particular tooth meshes with every tooth of the other gear before re-meshing with the starting tooth, distributing wear more evenly. (This was not implemented in the showcased gearbox design to simplify tooth number selection).

*   **Module of the Gears**:
    *   The **module defines the size of the gear**.
    *   A **small module (1.5 chosen)** was selected to keep the gearbox as small as possible.
    *   Choosing too small a module might lead to a 3D printer not being able to print a good enough tooth profile, potentially losing efficiency.

*   **CAD Software - Onshape**:
    *   Onshape is a **cloud-native CAD + PDM system**, used by businesses and available in a free version for home use.
    *   Created by the founders of SolidWorks, it offers benefits like **real-time collaboration** (similar to Google Docs) and eliminates concerns about file versions or PDM systems.
    *   Works in a browser, making it compatible across all operating systems and devices (including iOS and Android).

*   **Gear Generation in Onshape**:
    *   Uses **feature scripts library**, specifically the **spur gear feature script**.
    *   Parameters entered: Module (1.5), number of teeth (Sun/Planet 15, Ring 45).
    *   **Helical Gears**: Can be chosen with angle and direction. For two helical gears to mesh, they need **opposite helix directions** (one clockwise, one counterclockwise).
    *   **Chamfers and Central Bore**: Can be added.
    *   **Backlash Value**: Needs to be added because 3D printed parts usually come out slightly bigger. A value of **0.1 mm** gave good results for meshing.
    *   **Designing the Ring Gear**: A normal gear was generated, then a circle was drawn and extruded, and the gear was subtracted from the extrusion using the **Boolean function** to create internal teeth. This method was also used for planet carriers and the input shaft.

*   **Gearbox Design Basis**: The entire gearbox design was based on **existing shafts and bearings** (6mm shafts, 22mm length).
    *   Planet carrier designed to support shafts on both sides for better performance, making it slightly bulky.
---  
### IV. 3D Printing Considerations

*   **Slicing Software Settings for Accurate Dimensions**:
    *   **Horizontal expansion** and **hole horizontal expansion** are the most important settings.
    *   Default settings usually result in smaller outer dimensions and holes.
    *   Example settings: Horizontal expansion to **-0.02 mm** and hole horizontal expansion to **0.04 mm**. Test prints are recommended to find optimal values for a specific 3D printer.
---  
### V. Assembly Steps

1.  **Planet Carriers Assembly**:
    *   Composed of two sections connected with M3 bolts.
    *   Insert M3 threaded inserts.
    *   Install 6mm shafts for planet gears.
    *   Insert a suitable bushing (8mm outer diameter, 10mm length) into the planet gear (9mm thick). The extra 1mm of the bushing is distributed on both sides.
    *   Insert M6 washers on both sides of the gear so the bushing contacts the metal washer (better contact than plastic).
    *   Ideally, bearings that accept axial forces (due to helical teeth) should be used instead of bushings, but bushings were used due to available components.
    *   Once three planet gears are installed, insert the other carrier section and secure with M3 bolts.
    *   **Note**: Bearings for the sun gear/input shafts must be inserted into the carriers *before* assembling the two carrier sections, as they might not pass between planet gears later.

2.  **First Stage Assembly**: Insert the input shaft (Sun Gear) and assembled planet carrier into the housing (ring gear).

3.  **Second Stage Assembly**: Assembled the same way and inserted into the housing.

4.  **Housing Preparation**: Add threaded inserts for securing front and back covers.

5.  **Lubrication**: Apply lubrication to the gears for smoother operation.

6.  **Cover Installation**:
    *   Install bearing on the output shaft and put the front cover in place, securing with M3 bolts.
    *   Insert bearing for the input shaft on the back cover and secure with M3 bolts.

7.  **Motor Attachment (Nema 17 Stepper Motor)**:
    *   Secure an additional mounting plate to the stepper motor.
    *   Insert a grab screw into the input shaft.
    *   Slide the stepper motor shaft into the gearbox input shaft.
    *   Secure the mounting plate to the gearbox with M3 bolts.
    *   Tighten the motor shaft to the input shaft using the grab screw through a side hole in the mounting plate.
---  
### VI. Performance Tests

*   **Smooth Operation**: The completed gearbox showed smooth rotation and felt like there was almost no backlash initially. The output shaft rotated 16 times slower than the motor input.

*   **Backlash Test**:
    *   **Initial Observation**: At 10 cm distance, there was less than 1/100th of a millimeter play, which was surprisingly good accuracy/repeatability.
    *   **With Force Applied**: Around 1.2 mm displacement in both directions (even less, ~0.6 mm in each direction when the gearbox was clamped instead of the motor).

    *   **Measurement for Arc Minutes**:
        *   Applied a load of around **1.5 Newtons at a 10 cm distance** (estimated 1-2% of nominal torque capability).
        *   Displacement: **0.3 mm in one direction, 0.2 mm in the other**.
        *   **Displacement Angle (Alpha)**: Calculated using simple trigonometry, came out to be approximately **0.3 degrees**.
        *   **Backlash in Arc Minutes**: Since 1 arc minute is 1/60th of a degree, the backlash was calculated to be around **18 arc minutes**. This was considered a very impressive result.

*   **Torque Test**:
    *   Maximum reading of **20 Newtons at a 10 cm distance**, which is a torque of around **200 Newton-centimeters**.
    *   **Comparison to Motor Torque**: A Nema 17 stepper motor without the gearbox has a torque of about 28 Newton-centimeters.
    *   **Torque Increase**: The gearbox only provided about **7 to 8 times** the torque increase.
    *   **Efficiency**: This translates to a **very low efficiency of just around 50%**. In ideal conditions (16:1 reduction ratio), 16 times torque increase would be expected.
    *   **Reasons for Lower Efficiency**:
        *   **High friction** within the gearbox.
        *   The **tight fit of the gears** (which also contributes to good backlash results).
        *   Use of **bushings instead of ball bearings**.
    *   **Improving Efficiency**: Can be increased by lowering friction or printing gears with added backlash value, but this would **increase backlash** (a direct relationship).
