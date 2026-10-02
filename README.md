# 4-bit Synchronous FIFO

## Overview

This project implements a **4-bit wide, 4-depth synchronous FIFO (First In, First Out)** using Verilog HDL.

The FIFO stores four 4-bit data values and reads them in the same order in which they were written.

## Features

* 4-bit data width
* 4 storage locations
* Synchronous read and write operations
* Reset functionality
* Write and read pointers
* Data count tracking
* Full and empty status flags
* Verilog testbench verification

## FIFO Operation

Example:

```text
Write: 1010 → 0110 → 1100 → 1111

Read:  1010 → 0110 → 1100 → 1111
```

The data is read in the same order as it was written, demonstrating FIFO behavior.

## Inputs

| Signal   |  Width | Description          |
| -------- | -----: | -------------------- |
| clk      |  1 bit | Clock signal         |
| reset    |  1 bit | Resets the FIFO      |
| write_en |  1 bit | Enables writing data |
| read_en  |  1 bit | Enables reading data |
| data_in  | 4 bits | Input data           |

## Outputs

| Signal   |  Width | Description             |
| -------- | -----: | ----------------------- |
| data_out | 4 bits | Output data             |
| full     |  1 bit | Indicates FIFO is full  |
| empty    |  1 bit | Indicates FIFO is empty |

## Internal Signals

* `wr_ptr` – points to the next write location
* `rd_ptr` – points to the next read location
* `count` – stores the number of data items currently in the FIFO
* `mem` – stores the FIFO data

## Verification

The testbench verifies:

1. FIFO reset
2. Writing four 4-bit values
3. FIFO becoming full
4. Reading the stored values
5. FIFO becoming empty
6. Maintaining First In, First Out order

### Simulation Result

The following values were written:

```text
1010
0110
1100
1111
```

The values were read in the same order:

```text
1010
0110
1100
1111
```

The waveform confirms the correct operation of the FIFO.

## Tools Used

* Verilog HDL
* EDA Playground
* Icarus Verilog
* EPWave

## Learning Outcomes

Through this project, I learned:

* FIFO architecture
* Memory arrays in Verilog
* Read and write pointers
* Counters
* Clocked sequential logic
* Reset operation
* Full and empty flag generation
* Verilog testbench development
* Waveform-based functional verification
