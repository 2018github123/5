//Agent is a container class

class mem_agent extends uvm_agent;
	`uvm_component_utils(mem_agent)
	
	mem_driver    driver;
	mem_sequencer sequencer;
	mem_monitor   monitor;
	
	// construct
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	//build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db # (uvm_active_passive_enum)::get(this,"","is_active",is_active);
		
		if(is_active == UVM_ACTIVE) begin
			driver = mem_driver::type_id::create("driver",this);
			sequencer = mem_sequencer::type_id::create("sequencer",this);
		end
		monitor = mem_monitor::type_id::create("monitor",this);
	endfunction
	// connect phase
	function void connect_phase(uvm_phase phase);
		super.build_phase(phase);
		
		if(get_is_active() == UVM_ACTIVE) begin
		//connect driver and sequencer
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end
	endfunction
	
endclass
