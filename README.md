# YAPP Router Verification Environment

## Overview
This project implements a robust **Universal Verification Methodology (UVM)** testbench for the "Yet Another Packet Protocol" (YAPP) router. The environment is architected to support constrained-random verification with high reusability and scalability.

## Key Features
- **Modular UVC Architecture:** Fully implemented Agents, Drivers, Sequencers, and Monitors.
- **Constrained-Random Stimulus:** Custom `uvm_sequence_item` with variable payloads and parity injection logic.
- **Dynamic Configuration:** Utilizes `uvm_config_db` for runtime environment adjustments (Active/Passive agents).
- **Factory Overrides:** Leverages the UVM Factory for type overrides to inject corner-case transactions (e.g., short packets) without modifying source code.

## Tools Used
- **Languages:** SystemVerilog, UVM
- **Simulator:** Cadence Xcelium

