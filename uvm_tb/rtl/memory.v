// dut

module memory(
    input clk,
    input reset,
    input [3:0] addr,
    input wr_en,
    input rd_en,
    input  [7:0] wdata,
    output [7:0] rdata
);
reg [7:0] mem [15:0];
reg [7:0] rdata;

integer i;

always @(posedge clk)
begin
    if(reset) begin
        rdata <= 8'b0;  
        //mem reset
        i = 0;
        while(i != 16) begin
            mem[i] = 0;
            i = i + 1;
        end
    end
    else if(wr_en == 1 && rd_en == 0) begin
        mem[addr] <= wdata;
    end
    else if(wr_en == 0 && rd_en == 1) begin
        rdata <= mem[addr];
    end
    else begin
        rdata <= 8'bz;
        $display("Error");
    end
end
    
endmodule
