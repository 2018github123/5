
module design(intf.design if1);
    wire clk = if1.clk;
    wire [1:2] select = if1.select;
    reg [1:4]  dtoe,busdrv;
    assign if1.dtoe = dtoe;
    assign if1.bus = busdrv;
    always @(posedge clk) begin
        dtoe <= 0;
        busdrv <= 'bz;
        case (select)
            2'b00: ;
            2'b01: dtoe <= if1.etod;
            2'b10: busdrv <= if1.etod;
            2'b11: dtoe <= if1.bus;
        endcase
    end

endmodule
