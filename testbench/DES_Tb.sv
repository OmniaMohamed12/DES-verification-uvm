
`include "des.v"
`include "DES_IFC.svh"
import DES_Package::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
module DES_Tb;
    DES_IFC ifc();
    des dut(ifc.clk,ifc.reset_mode,ifc.in_load,ifc.encrypt_decrypt,ifc.in_data,ifc.in_key,ifc.out_data,ifc.out_ready);
    initial begin
        ifc.clk<=0;
        forever#5 ifc.clk<=~ifc.clk;
    end
    initial begin
        uvm_config_db#(virtual DES_IFC)::set(null,"uvm_test_top","vif",ifc);
        run_test("DES_Test");
  end
 
 
 initial begin
    $dumpfile("test.vcd");
    $dumpvars;
  end
endmodule

