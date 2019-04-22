class class_packet2;

    bit [7:0] address;
    bit [3:0] data;
    
    function new();
        this.address = 8'h9;
        this.data = 5;
    endfunction

    function void display();
        $display("--------------------------------------");
        $display("\t address is 0x%h",address);
        $display("\t data is %d",data);
        $display("--------------------------------------");
    endfunction

endclass
