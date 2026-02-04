class base_test extends uvm_test;

`uvm_component_utils(base_test)
router_tb tb;

function new (string name,uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
tb=new("tb",this);
`uvm_info("router_test_lib","build phase of test lib being executed",UVM_HIGH);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
endfunction


endclass