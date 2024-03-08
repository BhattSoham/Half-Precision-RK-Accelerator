# Half-Precision-RK-Accelerator
Hardware acceleration is crucial in enhancing performance, efficiency, and scalability across a wide range of computing applications. In this work, we have implemented a hardware accelerator specifically used for a Runge-Kutta Solver for solving an ordinary differential equation. Runge Kutta numerical methods are widely used to solve ordinary differential equations (ODEs). Among the Runge Kutta methods, RK2, RK3, and RK4 are commonly used variants for approximating the solutions to the differential equations. The hardware accelerators have been implemented using the VHDL programming language and deployed on the Zynq ZC702 FPGA evaluation board. The hardware accelerator intended for the fourth-order Runge-Kutta solver has the most power consumption while operating at a clock frequency of up to 80 Mhzs of the two solvers described in this research, based on the experimental findings. An in-depth evaluation of the power, and utilization of FPGA resources, and a time-consuming summary have also been included in this work. This study contributes to the enhancement of ODE solutions in high-performance computing applications. This work has been published at the IEEE ICEACE 2023 conference (https://ieeexplore.ieee.org/document/10442673).

For implementing the design using RK2, RK3, and RK4 methods, Xilinx Vivado's half-precision (16-bits) floating-point IP support has been used. The specifications are given below:

| FPU_Add       |FPU_Sub              |FPU_Mul               |MAC unit          |  
| --------------| --------------------|----------------------|------------------|
| 5             | 5                   |5                     |10                |

This is effective for an ODE given below:

𝑓 = − 2𝑥 − 𝑦 

All the in-detailed other specifications including on-chip power consumption details, FPGA hardware resources, and timing summary have been given in the paper (https://ieeexplore.ieee.org/document/10442673) on how to design the accelerations based on the half-precision FP formats.

For the working principle of the accelerator, please refer to (https://github.com/BhattSoham/Implementation-of-Runge-Kutta-Hardware-Accelerator).


