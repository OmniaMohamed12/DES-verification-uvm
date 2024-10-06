interface DES_IFC();
    logic clk;
    logic reset_mode;
    logic encrypt_decrypt;//0 for encryption and 1 for decryption
    logic[63:0] in_data;
    logic[63:0] in_key;
    logic in_load;
    logic [63:0] out_data;
    logic out_ready;
endinterface