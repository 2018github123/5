// functional_coverage.sv
/*
class xyz;
class helper;

module functional_coverage (
    input clk,    // Clock
    input clk_en, // Clock Enable
    input rst_n,  // Asynchronous reset active low
    
);

enum {red,green, blue} color;
bit [3:0] pixel_adr;
bit [3:0] pixel_offset;
bit [3:0] pixel_hue;

covergroup cg @(posedge clk);
       c: coverpoint color;
       h: coverpoint pixel_hue;
       o: coverpoint pixel_offset;
       d: coverpoint pixel_adr;
       axc: cross color,pixel_adr;
       all: cross color,h,o;

endgroup : cg

xyz xyz_obj = new(4);


endmodule

class helper;
    int m_ev;
endclass 

 class xyz;
    bit [3:0] m_x;
    int m_y;
    int m_z;
    helper m_obj;
    covergroup cov1 @(m_z);
        coverpoint m_x;
        coverpoint m_y;
     endgroup : cov1 

     covergroup Cov @(m_obj.m_ev);
            coverpoint m_y;
     endgroup : Cov

     function new ();
        cov1 = new;
        m_obj = new();
        Cov = new();  
     endfunction 

 endclass 
 */