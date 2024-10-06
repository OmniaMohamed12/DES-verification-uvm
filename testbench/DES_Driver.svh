/*######################################################################*\
## Class Name: DES_Driver  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Driver extends uvm_driver#(DES_Seq_Item);
    `uvm_component_utils(DES_Driver)
    DES_Seq_Item item;
    virtual DES_IFC vif;
    function new(string name="DES_Driver",uvm_component parent=null);
        super.new(name,parent);
    endfunction
    virtual function void build_phase(uvm_phase phase);
    
    endfunction
    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(item);
                drive_item(item);
            seq_item_port.item_done();
        end
    endtask
    virtual task drive_item(input DES_Seq_Item item);
        
        vif.reset_mode <= item.reset_mode;
        @(posedge vif.clk);
        vif.reset_mode <=1'b1;
        vif.in_load<=1'b1;
        vif.encrypt_decrypt <= item.encrypt_decrypt;
        vif.in_data <= item.in_data;
        vif.in_key <= item.in_key;
        `uvm_info("DES_Driver","Drv is sending the transactions to the dut",UVM_LOW)
        item.print();
        @(posedge vif.clk);
        vif.in_load<=1'b0;
        wait(vif.out_ready);


    endtask
endclass:DES_Driver