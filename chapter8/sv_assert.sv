// sv_assert.sv
`timescale 1 ns / 100 ps
module sv_assert;
    bit clk;    // Clock
    bit a; // Clock Enable
    bit b;
    int cfg_delay;

    always #5 clk = ~clk;

    initial begin
        cfg_delay = 4;
        a = 1;
        b = 0;
        #15 a = 0; b = 1;
        #10 a = 1;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10;
        $finish;
    end

    sequence delay_seq(v_delay);
        int delay;
        (1,delay=v_delay) ##0 first_match((1,delay=delay-1)[*0:$] ##0 delay <= 0);
    endsequence
    //并行断言
    a_1:assert property (@posedge clk) a |-> delay_seq(cfg_delay) |-> b;

    //即时断言
    always_comb
    begin
        a_ia:assert (a&&b);
    end

    // $rose()
    sequence s1;
        @(posedge clk) $rose(a);
    endsequence

    property p1;
        s1;
    endproperty

    a_2:assert property(p1);

    //禁止not属性

    sequence s2;
        a ##2 b;
    endsequence

    property p2;
        @(posedge clk) not(s2);
    endproperty

    a_3:assert property(p2);

endmodule