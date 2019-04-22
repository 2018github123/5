class class_inter;

    bit [7:0] address;
    bit [3:0] data;
    
    function new();
        this.address = 8'h10;
        this.data = 6;
    endfunction
/*
    function void display();
        $display("--------------------------------------");
        $display("\t address is 0x%h",address);
        $display("\t data is %d",data);
        $display("--------------------------------------");
    endfunction
*/
endclass
