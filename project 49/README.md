# Network Packet Routing Engine

## Description

The Network Packet Routing Engine is a digital system design project implemented using Verilog HDL.

The system receives a network packet along with destination information and determines the appropriate output port based on the destination address.

## Features

- 8-bit destination address
- 8-bit packet data
- Four output ports
- Packet validation
- Destination-based routing
- Verilog HDL implementation
- Testbench included
- Simulation waveform support

## Routing Logic

| Destination Range | Output Port |
|-------------------|-------------|
| 0 - 63            | Port 0      |
| 64 - 127          | Port 1      |
| 128 - 191         | Port 2      |
| 192 - 255         | Port 3      |

## Block Diagram

```text
             +----------------------+
Destination ->|                      |
Packet Data ->| Packet Routing       |----> Output Port
Packet Valid->| Engine               |
             |                      |----> Routed Data
             +----------------------+
                       |
                  Route Valid