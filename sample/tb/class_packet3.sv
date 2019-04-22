
class class_packet3;

    bit [7:0] address;
    bit [3:0] data;
    
    function new();
        class_inter itr = new();
        this.address = itr.address;
        this.data = itr.data;
    endfunction

    function void display();
        $display("--------------------------------------");
        $display("\t address is 0x%h",address);
        $display("\t data is %d",data);
        $display("--------------------------------------");
    endfunction

endclass
