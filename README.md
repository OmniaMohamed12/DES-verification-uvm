# des-verification-uvm
This project focuses on the Verification of Data Encryption Standard (DES) Using the Universal Verification Methodology (UVM).
The **Data Encryption Standard (DES)** is a symmetric key algorithm used to encrypt and decrypt data in blocks of 64 bits, with a 64-bit key.
The RTL design of DES is sourced from OpenCores.

![des block diagram](https://github.com/user-attachments/assets/b139688f-5a93-4b2b-84e9-738a3211de4d)
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
![DES UVM Env](https://github.com/user-attachments/assets/5189f4de-da25-422c-bd2e-9ce4d6311442)

## Coverage Results

- **Functional Coverage**:
![image](https://github.com/user-attachments/assets/4c90c9fa-7a34-44a0-b0ea-4e1a0188d02a)


- **Code Coverage**: 
![image](https://github.com/user-attachments/assets/65acab27-56b7-42ee-b0bb-2643828373f5)


For more information about the DES algorithm, please refer to the specification of DES in the doc/DES_spec.pdf directory.
