class DES_Agent extends uvm_agent;
    `uvm_component_utils(DES_Agent)
    DES_Agent_Config cfg;
    DES_Driver drv;
    DES_Monitor mon;
    DES_Sequencer sqr;
    uvm_analysis_port#(DES_Seq_Item) agent_ap;
    
    function new(string name="DES_Agent",uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        if(!uvm_config_db#(DES_Agent_Config)::get(this,"","DES_Agent_Config",cfg))
            `uvm_fatal("NO_AGENT_CONFIG","config obj must be set for the agent ")
        if(cfg.agent_is_active==1'b1)begin
            drv=DES_Driver::type_id::create("drv",this);
            sqr=DES_Sequencer::type_id::create("sqr",this);
            drv.vif=cfg.vif;
        end
        mon=DES_Monitor::type_id::create("mon",this);
        mon.vif=cfg.vif;
        agent_ap=new("agent_ap",this);
    endfunction
    virtual function void connect_phase(uvm_phase phase);
        if(cfg.agent_is_active==1'b1)begin
            drv.seq_item_port.connect(sqr.seq_item_export);
        end
        mon.mon_ap.connect(this.agent_ap);
    endfunction

endclass