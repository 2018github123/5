//seq_item_tb.sv
//--------------------------
//Simple TestBench to create and randomize sequence item
//--------------------------

//************ create example ******************

module seq_item_tb_create;
    //instance
    mem_seq_item seq_item;

    initial begin
        //create method
        seq_item = mem_seq_item::type_id::create();
        //randomziing the seq_item
        seq_item.randomize();
        //printing the seq_item
        seq_item.print();
    end
endmodule

//************ copy example ******************

module seq_item_tb_copy;
    //instance
    mem_seq_item seq_item_0;
    mem_seq_item seq_item_1;

    initial begin
        //create method
        seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
        seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
        //randomziing the seq_item
        seq_item_0.randomize();
        seq_item_0.print();
        //copy the seq_item_0
        seq_item_1.copy(seq_item_0);
        seq_item_1.print();
    end
endmodule

//************ clone example ******************

module seq_item_tb_clone;
    //instance 
    mem_seq_item seq_item_0;
    mem_seq_item seq_item_1;

    initial begin
        //create method
        seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
        seq_item_0.randomize();
        seq_item_0.print();

        //
        $cast(seq_item_1,seq_item_0.clone());

        //Changing the seq_item_1 values will not reflect on seq_item_0 values
        seq_item_1.addr = 8;
        seq_item_1.wdata = 'h56;

        `uvm_info("","Printing seq_item_1",UVM_LOW)
        seq_item_0.print();
        `uvm_info("","Printing seq_item_1",UVM_LOW)
        seq_item_1.print();
    end

endmodule

//********* pack and unpack ***********

module seq_item_tb;
    //instance
    mem_seq_item seq_item_0;
    mem_seq_item seq_item_1;

    bit bit_packed_data[];

    initial begin
        //create method
        seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
        seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
        //-------------   PACK   -------------------
        seq_item_0.randomize();
        seq_item_0.print();

        seq_item_0.pack(bit_packed_data);
        foreach(bit_packed_data[i]) begin
                `uvm_info("PACK",$sformatf("bit_packed_data[%0d] = %b",i,bit_packed_data[i]),UVM_LOW)           
        end
  

    //----UNPACK-----------
         `uvm_info("UNPACK","Before unpack",UVM_LOW)
        seq_item_1.print();
        seq_item_1.unpack(bit_packed_data);
        `uvm_info("UNPACK","After unpack",UVM_LOW);
        seq_item_1.print();
      end
endmodule

//pack bytes or unpack bytes

module seq_item_tb;
    //instance
    mem_seq_item seq_item_0;
    mem_seq_item seq_item_1;

    byte unsigned bit_packed_data[];

    initial begin
        //create method
        seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
        seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
        //-------------   PACK   -------------------
        seq_item_0.randomize();
        seq_item_0.print();

        seq_item_0.pack_bytes(bit_packed_data);
        foreach(bit_packed_data[i]) begin
                `uvm_info("PACK",$sformatf("bit_packed_data[%0d] = %b",i,bit_packed_data[i]),UVM_LOW)           
        end
  

    //----UNPACK-----------
        `uvm_info("UNPACK","Before unpack",UVM_LOW)
        seq_item_1.print();
        seq_item_1.unpack_bytes(bit_packed_data);
        `uvm_info("UNPACK","After unpack",UVM_LOW);
        seq_item_1.print();
      end
endmodule



module seq_item_tb;
    //instance
    mem_seq_item seq_item_0;
    mem_seq_item seq_item_1;

    int unsigned bit_packed_data[];

    initial begin
        //create method
        seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
        seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
        //-------------   PACK   -------------------
        seq_item_0.randomize();
        seq_item_0.print();

        seq_item_0.pack_ints(bit_packed_data);
        foreach(bit_packed_data[i]) begin
                `uvm_info("PACK",$sformatf("bit_packed_data[%0d] = %b",i,bit_packed_data[i]),UVM_LOW)           
        end
  

    //----UNPACK-----------
        `uvm_info("UNPACK","Before unpack",UVM_LOW)
        seq_item_1.print();
        seq_item_1.unpack_ints(bit_packed_data);
        `uvm_info("UNPACK","After unpack",UVM_LOW);
        seq_item_1.print();
      end
endmodule









