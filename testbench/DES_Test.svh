/*######################################################################*\
## Class Name: DES_Test  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Test extends uvm_test;

    `uvm_component_utils(DES_Test)

    DES_Env env;
    DES_Env_Config env_cfg;

    DES_Seq_Library seq_lib;

    

    function new(string name="DES_Test",uvm_component parent=null);
        super.new(name,parent);
    endfunction
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env=DES_Env::type_id::create("env",this);
        seq_lib=DES_Seq_Library::type_id::create("seq_lib");
        
        seq_lib.selection_mode= UVM_SEQ_LIB_RANDC;
        seq_lib.min_random_count=64;
        seq_lib.max_random_count=128;
        seq_lib.init_sequence_library();
       
        env_cfg=new("env_cfg");
        if(!uvm_config_db#(virtual DES_IFC)::get(this,"","vif",env_cfg.agent_cfg.vif))
            `uvm_fatal("NO_VIF","virtual interface must be set for the test")

        configure_env(env_cfg);

        uvm_config_db#(DES_Env_Config)::set(this,"env","DES_Env_Config",env_cfg);
    endfunction
    virtual function void configure_env(ref DES_Env_Config cfg);
        //agent config
        cfg.agent_cfg.agent_is_active=1'b1;
        //env config
        cfg.env_has_agent=1'b1;
        cfg.env_has_cov=1'b1;
        cfg.env_has_scb=1'b1;
    endfunction
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);

            assert(seq_lib.randomize());
            seq_lib.start(env.agent.sqr);

        phase.drop_objection(this);

    endtask
endclass
