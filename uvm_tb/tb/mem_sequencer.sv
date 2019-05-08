// Sequencer:
//          generate transaction
//          send to driver
// 
class mem_sequencer extends uvm_sequencer #(mem_transaction);
	`uvm_component_utils(mem_sequencer)

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction
    
    //
    /*
    // start sequence in sequencer
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        mem_sequense seq;
        phase.raise_objection(this);
        seq = mem_sequense::type_id::create("seq");
        seq.start(this);
        phase.drop_objection(this);

    endtask */
    
endclass