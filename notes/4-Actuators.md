
# 📌 Stepper Motors Used

| Model                | NEMA Size | Holding Torque | Step Angle | Shaft Type   | Extra Features       |
| -------------------- | --------- | -------------- | ---------- | ------------ | -------------------- |
| **57HS76-2804-05**   | NEMA 23   | **18.9 kg-cm** | 1.8°       | D-Type Shaft | Hybrid stepper motor |
| **42HS34-0404**      | NEMA 17   | **2.6 kg-cm**  | 1.8°       | D-Type Shaft | Single shaft         |
| **JK42HS60-1206F**   | NEMA 17   | **6.5 kg-cm**  | 1.8°       | D-Type Shaft | –                    |
| **42HS48-1204A-20F** | NEMA 17   | **5.6 kg-cm**  | 1.8°       | D-Type Shaft | Detachable cable     |

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

5. **Special Features** →

   * Some motors come with detachable cables (like **42HS48-1204A-20F**) → easier for maintenance and wiring.
   * Hybrid steppers (like **57HS76-2804-05**) → better precision and torque.


---

# ⚡ Stepper Motor Drivers

| Driver                              | Current Capacity | Microstepping | Pros                                                                                               | Cons                                            | Best Use                                                  |
| ----------------------------------- | ---------------- | ------------- | -------------------------------------------------------------------------------------------------- | ----------------------------------------------- | --------------------------------------------------------- |
| **TB6600**                          | Up to \~4.5A     | 1/16          | High current capacity, suitable for larger NEMA23 motors                                           | Bigger in size, more expensive                  | Heavy-duty steppers (e.g., base joints, CNC machines)     |
| **TMC2209** ⭐ *Best Choice*         | Up to \~2A       | 1/256         | Silent operation (StealthChop), high precision, energy-efficient, advanced features (UART control) | Slightly higher cost                            | Robotics & 3D printing (where precision + silence matter) |
| **DRV8825** 💰 *Good Budget Choice* | Up to \~2.2A     | 1/32          | Affordable, stable, better than A4988, easy to find                                                | Louder & less smooth than TMC drivers           | General robotics, mid-range motors                        |
| **A4988** 🟢 *Basic Choice*         | Up to \~1A       | 1/16          | Very cheap, widely available, simple to use                                                        | Noisy, low current capacity, less smooth motion | Small projects, low-torque NEMA17 motors                  |

---

## 📖 Notes

1. **TMC2209** → Best choice for robotics (silent, smooth, efficient).
2. **DRV8825** → Good middle ground for budget projects.
3. **A4988** → Entry-level, fine for learning or small robots.
4. **TB6600** → Overkill for small projects, but **essential for larger NEMA23 motors** (like your **57HS76-2804-05**).

---

