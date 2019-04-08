//Interface:
//          interface will group the signals.
//          

interface intf (input logic clk,reset);
    logic valid;
    logic [3:0] a;
    logic [3:0] b;
    logic [6:0] c;
endinterface