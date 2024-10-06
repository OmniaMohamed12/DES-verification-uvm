/*######################################################################*\
## Class Name: DES_Monitor  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Monitor extends uvm_monitor;
    `uvm_component_utils(DES_Monitor)
    DES_Seq_Item item;
    virtual DES_IFC vif;
    uvm_analysis_port#(DES_Seq_Item) mon_ap;
    function new(string name="DES_Monitor",uvm_component parent=null);
        super.new(name,parent);
    endfunction
    virtual function void build_phase(uvm_phase phase);
        item=DES_Seq_Item::type_id::create("item");
        mon_ap=new("mon_ap",this);
    endfunction
    virtual task run_phase(uvm_phase phase);
        forever begin
            @(posedge vif.clk);
            @(posedge vif.clk);
            wait(vif.out_ready);
            item.in_data = vif.in_data;
            item.in_key  = vif.in_key;
            item.out_data = vif.out_data;
            item.encrypt_decrypt = vif.encrypt_decrypt;
            item.out_ready =vif.out_ready;
            item.reset_mode=vif.reset_mode;
            item.in_load=vif.in_load;
            `uvm_info("DES_Monitor","Mon is sending the transactions to scb and sub",UVM_LOW)
            item.print();
            mon_ap.write(item);

        end
    endtask
   

endclass:DES_Monitor