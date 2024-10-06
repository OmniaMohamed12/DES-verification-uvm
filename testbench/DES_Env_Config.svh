class DES_Env_Config extends uvm_object;
    `uvm_object_utils(DES_Env_Config)
    
    bit env_has_agent=1'b0;
    bit env_has_scb=1'b0;
    bit env_has_cov=1'b0;
    DES_Agent_Config agent_cfg;

    function new(string name="DES_Env_Config");
        super.new(name);
        agent_cfg=new("agent_cfg");
    endfunction
endclass