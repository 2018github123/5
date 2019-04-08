//mem_sequence.sv


class mem_sequencer extends  uvm_sequencer#(mem_seq_item);
    `uvm_sequencer_utils(mem_sequencer)
    function new(string name,uvm_component parent);
        super.new(name,parent);
    endfunction : new

endclass : mem_sequencer