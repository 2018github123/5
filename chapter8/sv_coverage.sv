// sv_coverage.sv
module sv_coverage;
    logic clk;
    logic [7:0] addr;
    logic  wr_rd;

    covergroup cg @(posedge clk);
        c1:coverpoint addr;
        c2:coverpoint wr_rd;
           
    endgroup : cg

    cg cover_inst = new();

endmodule