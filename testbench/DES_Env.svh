/*######################################################################*\
## Class Name: DES_Env  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Env extends uvm_env;
    `uvm_component_utils(DES_Env)
    DES_Env_Config cfg;
    DES_Agent agent;
    DES_Scoreboard scb;
    DES_Subscriber cov;
    function new(string name="DES_Env",uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        if(!uvm_config_db#(DES_Env_Config)::get(this,"","DES_Env_Config",cfg))
            `uvm_fatal("NO_ENV_CONFIG","config obj must be set for the env ")
        if(cfg.env_has_agent==1'b1)begin
            agent=DES_Agent::type_id::create("agent",this);
            uvm_config_db#(DES_Agent_Config)::set(this,"agent","DES_Agent_Config",cfg.agent_cfg);
        end
        if(cfg.env_has_scb==1'b1)begin
            scb=DES_Scoreboard::type_id::create("scb",this);
            
        end
        if(cfg.env_has_cov==1'b1)begin
            cov=DES_Subscriber::type_id::create("cov",this);
            
        end
    endfunction
    virtual function void connect_phase(uvm_phase phase);
        if(cfg.env_has_agent==1'b1 && cfg.env_has_scb==1'b1)begin
            agent.agent_ap.connect(scb.analysis_imp);
        end
        if(cfg.env_has_agent==1'b1 && cfg.env_has_cov==1'b1)begin
            agent.agent_ap.connect(cov.sub_imp);
        end
    endfunction
endclass