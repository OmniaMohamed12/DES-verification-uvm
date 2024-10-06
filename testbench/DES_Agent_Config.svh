class DES_Agent_Config extends uvm_object;
    `uvm_object_utils(DES_Agent_Config)

    bit agent_is_active=1'b0;
    virtual DES_IFC vif;
    function new(string name="DES_Agent_Config");
        super.new(name);
    endfunction
endclass