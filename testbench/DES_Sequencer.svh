class DES_Sequencer extends uvm_sequencer#(DES_Seq_Item);
    `uvm_component_utils(DES_Sequencer)

    function new(string name="DES_Sequencer",uvm_component parent=null);
        super.new(name,parent);
    endfunction
endclass