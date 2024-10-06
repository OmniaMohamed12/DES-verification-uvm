/*######################################################################*\
## Class Name: DES_Seq_Item   
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Seq_Item extends uvm_sequence_item;
    rand bit reset_mode;
    rand bit encrypt_decrypt;//0 for encryption and 1 for decryption
    rand bit[63:0]in_data;
    rand bit[63:0] in_key;//cipher key
    logic in_load;
    logic [63:0] out_data;
    logic out_ready;

    `uvm_object_utils_begin(DES_Seq_Item)
        `uvm_field_int(reset_mode,UVM_ALL_ON)
        `uvm_field_int(encrypt_decrypt,UVM_ALL_ON)
        `uvm_field_int(in_data,UVM_ALL_ON | UVM_HEX)
        `uvm_field_int(in_key,UVM_ALL_ON | UVM_HEX)
        `uvm_field_int(in_load,UVM_ALL_ON)
        `uvm_field_int(out_data,UVM_ALL_ON | UVM_HEX)
        `uvm_field_int(out_ready,UVM_ALL_ON)
        `uvm_field_int(reset_mode,UVM_ALL_ON)
        `uvm_field_int(reset_mode,UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name="DES_Seq_Item");
        super.new(name);
    endfunction

endclass:DES_Seq_Item