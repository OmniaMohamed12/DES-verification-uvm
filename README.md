# des-verification-uvm
This project focuses on the Verification of Data Encryption Standard (DES) Using the Universal Verification Methodology (UVM).
The **Data Encryption Standard (DES)** is a symmetric key algorithm used to encrypt and decrypt data in blocks of 64 bits, with a 64-bit key.
The RTL design of DES is sourced from OpenCores.
![des block diagram - Page 1](https://github.com/user-attachments/assets/c00c1c45-699c-4671-b998-8c609a067a7e)

## Interface Signals
The following table describes the interface signals used in the DES module:

| **Signal Name**     | **Direction** | **Width** | **Description**                                   |
|---------------------|---------------|-----------|---------------------------------------------------|
| `clk`               | Input         | 1-bit     | Clock signal            |
| `reset_mode`        | Input         | 1-bit     | Active low reset                         |
| `encrypt_decrypt`   | Input         | 1-bit     | Mode control: 0 for encryption, 1 for decryption  |
| `in_data`           | Input         | 64-bit    | Input data for encryption(plain text) or decryption (cipher text)          |
| `in_key`            | Input         | 64-bit    | Encryption/decryption key                         |
| `in_load`           | Input         | 1-bit     | Load signal to load input data and key            |
| `out_data`          | Output        | 64-bit    | Output data after encryption (cipher text) or decryption(plain text)       |
| `out_ready`         | Output        | 1-bit     | Signal indicating output data is ready            |

## UVM Testbench Architecture
![New board - Page 1 (1)](https://github.com/user-attachments/assets/25429527-de53-43b7-b20d-a2f1b22a6f01)

## Coverage Results

- **Functional Coverage**:
- ![Picture4](https://github.com/user-attachments/assets/f35c0211-02de-48db-9e46-d72ce3ccc444)


- **Code Coverage**:
- ![Picture3](https://github.com/user-attachments/assets/6a18da85-63e2-4223-94bf-88b62609b20d)



For more information about the DES algorithm, please refer to the DES specification in the `doc/DES_spec` directory.
