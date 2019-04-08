`include "interface.sv"
`include "test.sv"

module tb_top;
    bit clk;
    bit reset;

    //
    always #5 clk = ~clk;

    //
    initial begin
        reset = 1;
        #5 reset = 0;
    end

    intf i_intf(clk,reset);

    test t1(i_intf);

    adder DUT(
        .clk(i_intf.clk),
        .reset(i_intf.reset),
        .a(i_intf.a),
        .b(i_intf.b),
        .valid(i_intf.valid),
        .c(i_intf.c)
        );
    //
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule