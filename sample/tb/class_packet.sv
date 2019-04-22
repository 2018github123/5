class class_packet;

    bit [7:0] address;
    bit [3:0] data;
    
    function new(bit [7:0] address,bit [3:0] data);
        this.address = address;
        this.data = data;
    endfunction

    function void display();
        $display("--------------------------------------");
        $display("\t address is 0x%h",address);
        $display("\t data is %d",data);
        $display("--------------------------------------");
    endfunction

endclass
