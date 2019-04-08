// mem_model_env.sv

class mem_model_env extends uvm_env;

  mem_agent mem_agnt;
  
  `uvm_component_utils(mem_model_env)
    
  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mem_agnt = mem_agent::type_id::create("mem_agnt", this);
  endfunction : build_phase

endclass : mem_model_env