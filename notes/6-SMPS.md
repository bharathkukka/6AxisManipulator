
# ⚡ SMPS (Switched Mode Power Supply) for Stepper Motor Control

## 🔌 Understanding SMPS Terminals

| Terminal      | Label                 | Function                     |
| ------------- | --------------------- | ---------------------------- |
| **AC Input**  | `L`                   | Live (Hot wire from wall)    |
|               | `N`                   | Neutral                      |
|               | ⏚                     | Earth/Ground (safety)        |
| **DC Output** | `V+` or `+V`          | Positive (+) 24V DC          |
|               | `V-` or `-V` or `COM` | Negative (-) / Common Ground |

👉 Most SMPS units provide multiple `V+` and `V-` screw terminals. These are internally connected, allowing you to wire multiple drivers easily.

---

## 📏 Key Specifications for our Robotic Arm

1. **Voltage: 24V**

   * Why? Steppers (especially **NEMA 23**) perform better (higher torque at speed) with 24V vs 12V.
   * Compatible with drivers like **TB6600, DRV8825, TMC2209**.

2. **Current: ≥ 15A**

   * **Calculation (worst-case):**

     * NEMA 23 (18.9 kg-cm) → \~2.8A
     * NEMA 17 (6.5 kg-cm × 4 motors) → \~1.8A × 4 = 7.2A
     * NEMA 17 (5.6 / 2.6 kg-cm, end-effector) → \~1.3A
     * **Total = 11.3A**
   * Add **20–25% safety margin** → **15A supply recommended**.

3. **Power (Wattage): 360W**

   * Formula:

     ```
     Power = Voltage × Current
     24V × 15A = 360W
     ```
   * SMPS may be listed as **24V 15A 360W** (all the same thing).

---

## 🛒 What to Buy

* **24V 15A 360W Enclosed SMPS** (standard unit used in CNC, 3D printers, robotics).
* Comes with screw terminals for clean wiring.
* Widely available, reliable, and cost-effective.

---

## ✅ Why Use One Big SMPS Instead of Many Small Ones?

### 1. Cost & Space 💸

* **Cheaper**: One 360W unit < six separate 60W units.
* **Compact**: Saves enclosure space → cleaner build.

### 2. Simplicity & Reliability ⚙️

* **Single power input** (no mess of 6 AC cables).
* **Shared power pool** → dynamic loads balanced across motors (one motor hard-working, others idle).

### 3. Electrical Stability ⚡

* Multiple supplies → risk of **ground loops** (small voltage differences causing noise).
* Noise can corrupt control signals (step/dir pulses).
* **One SMPS = one clean ground reference → stable, reliable operation.**

---

## 🎯 Conclusion

Using a **single 24V 15A 360W SMPS** is the **professional choice**:

* ✅ Cheaper
* ✅ More compact
* ✅ Easier wiring
* ✅ More reliable
* ✅ Electrically safer

Perfect for powering your **6-DOF robotic arm** with NEMA17 + NEMA23 steppers.

---
