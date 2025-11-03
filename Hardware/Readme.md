# 📌 Stepper Motors Used

| Model                        | NEMA Size | Holding Torque | Step Angle | Shaft Type         | Extra Features                |
|------------------------------|-----------|---------------|------------|--------------------|-------------------------------|
| **57HS76-2804-05**           | NEMA 23   | **18.9 kg-cm** | 1.8°       | D-Type Shaft       | Hybrid stepper motor          |
| **JK42HS60-1206F**           | NEMA 17   | **6.5 kg-cm**  | 1.8°       | D-Type Shaft       | –                             |
| **42HS48-1204A-20F**         | NEMA 17   | **5.6 kg-cm**  | 1.8°       | D-Type Shaft       | Detachable cable              |
| **42HS34-0404**              | NEMA 17   | **2.6 kg-cm**  | 1.8°       | D-Type Single Shaft| –                             |
| **JK42HS34-1334BED-01**      | NEMA 17   | **2.6 kg-cm**  | 1.8°       | Round Type Shaft   | Closed loop stepper motor     |

---

## 📖 Notes

1. **NEMA Size** → Refers to the faceplate dimensions of the motor:

   * **NEMA 17** = 42 × 42 mm
   * **NEMA 23** = 57 × 57 mm

2. **Holding Torque** (kg-cm) → The maximum torque the motor can hold when energized but not rotating. Higher torque = more load handling.

3. **Step Angle** → Most of these are **1.8° per step**, meaning **200 steps per revolution** (without microstepping).

4. **Shaft Type** →

   * **D-Type Shaft**: Has a flat edge to prevent slipping, useful for gears/couplings.
   * **Single Shaft**: Only one side extends.
   * **Round Type Shaft**: Used in closed loop motors for encoder mounting.

5. **Special Features** →

   * Some motors come with detachable cables (like **42HS48-1204A-20F**) → easier for maintenance and wiring.
   * Hybrid steppers (like **57HS76-2804-05**) → better precision and torque.
   * Closed loop stepper (like **JK42HS34-1334BED-01**) → includes feedback for improved accuracy and reliability.


---

# ⚡ Stepper Motor Drivers

| Driver   | Current Capacity | Microstepping | Pros                                                      | Cons                       | Best Use                                  |
|----------|------------------|---------------|-----------------------------------------------------------|----------------------------|--------------------------------------------|
| **TB6600** | Up to ~4.5A     | 1/16          | High current capacity, suitable for larger NEMA23 motors  | Bigger in size, expensive  | Heavy-duty steppers (base joints, CNC)     |

---

## 📖 Notes

1. **TB6600** → Essential for larger NEMA23 motors (like your **57HS76-2804-05**). High current, robust, and reliable for demanding applications.

---

# 🔋 Power Supply Used

| Model         | Type  | Output Voltage | Output Current | Output Power | Features                        | Typical Use                      |
|---------------|-------|---------------|---------------|--------------|----------------------------------|-----------------------------------|
| SMPS 24V 15A  | SMPS  | 24V DC        | 15A           | 350W         | High efficiency, compact, protected | Powers all motors, drivers, and control electronics |

---

## 📖 Notes
1. **SMPS (Switched-Mode Power Supply)** is chosen for its high efficiency, compact size, and ability to handle large loads reliably.
2. **24V 15A (350W)** is suitable for powering multiple stepper motors, drivers, and control boards in robotics and CNC applications.
3. Built-in protections (overcurrent, overvoltage, short-circuit, thermal) ensure safe operation.
4. Always ensure total system load does not exceed rated output (15A, 350W).

---

# 🛰️ Sensors Used

| Model/Type                | Function                | Key Features                                 | Typical Use                                 |
|---------------------------|------------------------|-----------------------------------------------|---------------------------------------------|
| ESP32-CAM                 | Camera, Wireless Comm. | WiFi, Bluetooth, onboard camera, microSD      | Wireless image streaming, remote monitoring |
| Position Sensor (Stepper) | Position Feedback      | Used for open loop stepper motors             | Detects missed steps, enables closed loop   |
| AS5600 Absolute Encoder   | Position Sensing       | 12-bit resolution, magnet wheel, I2C output   | Precise shaft position, closed loop control |

---

## 📖 Notes
1. **ESP32-CAM**: Combines camera, WiFi, and Bluetooth for wireless vision and control in robotics/automation.
2. **Position Sensor**: Added to open loop stepper motors to detect position and enable closed loop operation.
3. **AS5600 Absolute Encoder**: 12-bit magnetic encoder, provides high-resolution absolute position feedback, ideal for closed loop stepper systems.

---

# 🛠️ Bearings Used in Gear Box

| Bearing Model/Type                  | Inner Diameter (ID) | Outer Diameter (OD) | Width (W) | Quantity | GearBox | Notes                       |
|-------------------------------------|---------------------|---------------------|-----------|----------|---------|-----------------------------|
| Miniature Ball Bearing 6x13x5mm     | 6mm                 | 13mm                | 5mm       | 94       | CG      | Model 686                   |
| MR6802 - 2RS Ball Bearing 15x24x5mm | 15mm                | 24mm                | 5mm       | 10       | CG      | Model 6802                  |
| Ball Bearing 35x47x7mm              | 35mm                | 47mm                | 7mm       | 4        | CG      | Model 6807                  |
| Ball Bearing 25x37x7mm              | 25mm                | 37mm                | 7mm       | 2        | PG      | Model 6805                  |
| Ball Bearing 17x26x5mm              | 17mm                | 26mm                | 5mm       | 2        | PG      | Model 6803                  |
| Ball Bearing 12x21x5mm              | 12mm                | 21mm                | 5mm       | 2        | PG      | Model 6802                  |
| Ball Bearing 5x16x5mm               | 5mm                 | 16mm                | 5mm       | 30       | HG      | Model 625                   |
| Bearing 35x47x7mm                   | 35mm                | 47mm                | 7mm       | 4        | HG      | Model 6807                  |

---

## 📖 Notes
- Bearings are essential for reducing friction and supporting rotating shafts in gear boxes.
- Different models and sizes are chosen based on load, speed, and gearbox configuration (CG: Cycloidal Gearbox, PG: Planetary Gearbox, HG: Harmonic Gearbox).
- Quantity reflects the number of bearings used in each gearbox type for optimal performance and durability.
