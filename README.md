#  Reversible Gate-Based ALU

This project presents a **reversible logic-based Arithmetic Logic Unit (ALU)** designed using fundamental reversible gates such as **Toffoli**, **Fredkin**, **Peres**, and **Feynman gates**. The ALU is optimized for low power, minimal garbage output, and quantum cost efficiency, making it suitable for future **quantum computing**, **low-power embedded systems**, and **nanotechnology** applications.

---

##  Overview

Reversible logic circuits differ from traditional logic by ensuring that no information is lost, thereby eliminating energy dissipation theoretically. This ALU performs both **arithmetic** and **logic operations** with **reversibility preserved** across all modules.

---

## Features

-  4-bit ALU using reversible logic gates
-  Supports: Addition, Subtraction, AND, OR, XOR, XNOR
-  Implemented with: **Toffoli**, **Fredkin**, **Peres**, **Feynman gates**
-  Reduced quantum cost, garbage outputs, and constant inputs
-  Simulated in **Xilinx**

---

##  Functional Units

| Operation Type | Description                   | Reversible Gates Used        |
|----------------|-------------------------------|-------------------------------|
| Arithmetic     | Add/Sub using full adders     | `Toffoli`, `Peres`, `Feynman` |
| Logical        | Bitwise AND, OR, XOR, XNOR     | `Fredkin`, `Peres`, `Feynman` |


---

##  Simulation

-  Simulated using [Xilinx Vivado](https://www.xilinx.com/support/download.html)
-  Testbenches verify all `4` operations
-  Performance metrics recorded:
- Garbage outputs
- Constant inputs
- Quantum cost



