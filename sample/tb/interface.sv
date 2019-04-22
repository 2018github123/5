interface intf(input rst,input clk);
    logic [1:2] select;
    logic [1:4] dtoe;
    logic [1:4] etod;
    wire  [1:4] bus;

    modport env (inout bus,output etod,select,input dtoe,rst,clk);
    modport design (inout bus,output dtoe,input etod,select,rst,clk);
  
endinterface
