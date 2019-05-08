// Sequence
//         send transaction to sequencer
//
class mem_sequence extends uvm_sequence #(mem_transaction);

    `uvm_object_utils(mem_sequence)
    
    mem_transaction trans;

    function  new (string name = "mem_sequence");
        super.new(name);
    endfunction 

    virtual task body();
        repeat (10) begin
            `uvm_do(trans)
        end
        #1000;
    endtask : body

endclass
