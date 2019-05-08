// Environment 

class mem_model_env extends uvm_env;
	`uvm_component_utils(mem_model_env);
	
	//agent and scoreboard instance
	//in_agent and out_agent
	mem_agent in_agent;
	mem_agent out_agent;
	
	mem_scoreboard scoreboard;
	reference_dut ref_mdl;
	
	uvm_tlm_analysis_fifo #(mem_transaction) agt_mdl_fifo;	
	uvm_tlm_analysis_fifo #(mem_transaction) agt_scb_fifo;
	uvm_tlm_analysis_fifo #(mem_transaction) mdl_scb_fifo;
	//new - constructor
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	// build phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	    uvm_config_db # (uvm_active_passive_enum)::set(this,"in_agent","is_active",UVM_ACTIVE);
	    uvm_config_db # (uvm_active_passive_enum)::set(this,"out_agent","is_active",UVM_PASSIVE);
		in_agent = mem_agent::type_id::create("in_agent",this);
		out_agent = mem_agent::type_id::create("out_agent",this);
		scoreboard = mem_scoreboard::type_id::create("mem_scoreboard",this);

		agt_mdl_fifo = new("agt_mdl_fifo",this);//connect monitor and reference 
		agt_scb_fifo = new("agt_scb_fifo",this);
		mdl_scb_fifo = new("mdl_scb_fifo",this);
	endfunction
	
	// connect phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		// in_agent : monitor and refencence model connected
		in_agent.monitor.item_collected_port.connect(agt_mdl_fifo.analysis_export);
		ref_mdl.port.connect(agt_mdl_fifo.blocking_get_export);
		//reference and scoreboard
		ref_mdl.ap.connect(mdl_scb_fifo.analysis_export);
		scoreboard.exp_port.connect(mdl_scb_fifo.blocking_get_export);
		// out_agent_monitor and scoreboard connected
		out_agent.monitor.item_collected_port.connect(agt_scb_fifo.analysis_export);
		scoreboard.act_port.connect(agt_scb_fifo.blocking_get_export);
	endfunction
    
endclass





