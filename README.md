# IdentificationAndOptimalControl_2024
# 🌱 Hierarchical Model Predictive Control for Greenhouse Climate Optimization

## 📌 Overview
This project presents a hierarchical control strategy for optimizing the climate control of Venlo-type greenhouses. The aim is to improve energy efficiency and reduce operational costs through a two-layer control architecture.

## 🔬 Key Contributions
- **🏡 Greenhouse Climate Modeling**: Developed mathematical models for temperature, humidity, and CO2 concentration control.
- **⚖️ Hierarchical Control Architecture**:
  - **Upper Layer (Optimization)**: Generates set points based on three different strategies:
    1. Minimizing energy consumption.
    2. Minimizing energy cost under a time-of-use (TOU) tariff.
    3. Minimizing total operational cost, including ventilation and CO2 supply.
  - **Lower Layer (Control)**: Implements a closed-loop Model Predictive Control (MPC) strategy to track the optimal set points.
- **📊 Comparative Analysis**:
  - Evaluates MPC performance against open-loop control.
  - Introduces an additional strategy considering specific greenhouse conditions and renewable energy sources.

## 📈 Results
- ✅ The hierarchical MPC strategy significantly reduces greenhouse operating costs.
- 🌿 MPC demonstrates superior tracking performance compared to open-loop control.
- 💡 Optimization strategies effectively balance energy consumption, cost reduction, and climate stability.

## 🚀 Future Work
- 🌞 Integrate renewable energy sources such as solar panels more effectively.
- 📉 Develop adaptive control strategies for seasonal variations in climate.

## 👩‍🔬 Authors
**Fiorella Maria Romano, Claudia Panza**  
📍 Scuola Politecnica e delle Scienze di Base, Ingegneria dell’Automazione e Robotica  
# References
Hierarchical model predictive control of Venlo-type greenhouse climate for improving energy efficiency and reducing operating cost. Dong Lin, Lijun Zhang, Xiaohua Xi

📅 Academic Year 2024/2025

## 📜 Credits
This work is based on the paper "Hierarchical Model Predictive Control of Venlo-type Greenhouse Climate for Improving Energy Efficiency and Reducing Operating Cost" by Dong Lin, Lijun Zhang, Xiaohua Xi and other referenced literature in the field of greenhouse climate optimization.
