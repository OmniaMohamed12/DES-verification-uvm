/*######################################################################*\
## Class Name: DES_Subscriber  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Subscriber extends uvm_subscriber#(DES_Seq_Item);
    `uvm_component_utils(DES_Subscriber)

    DES_Seq_Item item;
    uvm_analysis_imp#(DES_Seq_Item,DES_Subscriber) sub_imp;

    covergroup cg;

        encrypt_decrypt: coverpoint item.encrypt_decrypt{
            bins encrypt={0};
            bins decrypt={1};
        }
        in_data:coverpoint item.in_data{
            bins allzeros={64'h0000000000000000};
            bins allones={ 64'hffffffffffffffff};
            bins b1={[0:(2**4)-1]};
            bins b2={[(2**4):(2**16)-1]};
            bins b3={[(2**16):2**64-1]};
        }
        in_key:coverpoint item.in_key{
            bins allzeros={64'h0000000000000000};
            bins allones={ 64'hffffffffffffffff};
            bins b1={[0:(2**4)-1]};
            bins b2={[(2**4):(2**16)-1]};
            bins b3={[(2**16):2**64-1]};
        }
        
        out_data:coverpoint item.out_data;

        cross encrypt_decrypt,in_data,in_key;

        ready: coverpoint item.out_ready{
            bins high={1};
        }
        load: coverpoint item.in_load{
            bins low={0};
        }
        rst: coverpoint item.reset_mode{
            bins high={1};
        }
        cross encrypt_decrypt,rst;
    endgroup
    function new (string name="DES_Subscriber", uvm_component parent =null);
        super.new(name,parent);
        cg=new();
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sub_imp=new("sub_imp",this);
    endfunction
    virtual function void write(DES_Seq_Item t);
        item=t;
        cg.sample();
    endfunction
    function void report_phase (uvm_phase phase);
        `uvm_info("DES_Subscriber", $sformatf("coverage =%0d", cg.get_coverage), UVM_NONE);
    endfunction
endclass:DES_Subscriber