// transaction (= mem_seq_item)

import uvm_pkg::*;

class mem_transaction extends uvm_sequence_item ;

	//data and control fields
	rand bit [3:0] addr;
	rand bit wr_en;
	rand bit rd_en;
	rand bit [7:0] wdata;
		  bit [7:0] rdata;
		  
	//Utility and Field macros
	`uvm_object_utils_begin(mem_transaction)
		`uvm_field_int(addr,UVM_ALL_ON)
		`uvm_field_int(wr_en,UVM_ALL_ON)
		`uvm_field_int(rd_en,UVM_ALL_ON)
		`uvm_field_int(wdata,UVM_ALL_ON)
	`uvm_object_utils_end
	
	//Constructor
	function new(string name = "mem_transaction");
		super.new(name);
	endfunction
	
	//constraint
	constraint wr_rd_c {
	     wr_en != rd_en;
	 };
	
	extern function void mem_print();
	extern function bit mem_compare(mem_transaction tr);
		
endclass


//-----------------------------------------------------------

function void mem_transaction::mem_print();
    $display("mem_print.....");
endfunction

function bit mem_transaction::mem_compare(mem_transaction tr);
    bit result;
    
    if(tr == null) begin
        `uvm_fatal("mem_transaction","tr is NULL")           
    end
    
endfunction

