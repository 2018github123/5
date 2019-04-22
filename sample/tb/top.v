
module top();
 
     // $display("-----------------------------------");
      bit rst, clk;
      intf    i1(rst, clk);
      env     e1(i1);
      design  d1(i1);

      initial begin
        clk = 0;
        forever begin
          #5 clk = 1;
          #5 clk = 0;
        end
      end
    //$display("-----------------------------------");
/*
    initial begin
          class_packet pkt;
          class_packet2 pkt2;
          class_packet3 pkt3;

          pkt = new(8'h8,4);
          pkt.display();
                   
          pkt2 = new();
          pkt2.display();
          
          pkt3 = new();
          pkt3.display();
    end

    initial begin 
        class_bus bus = new();
        repeat (50) begin 
            if(bus.randomize() == 1)
                $display("\t addr = %16h   data = %h\n",bus.addr,bus.data);
            else
                $display("\t Randomization failed.\n");
        end
    end

    initial begin 
        class_mybus mybus = new();
        repeat (50) begin 
            if((mybus.randomize() with {mybus.atype == low;}) == 1)
                $display("\t atype is %s  addr = %16h   data = %h\n",mybus.atype,mybus.addr,mybus.data);
               // $display("\t addr = %16h   data = %h\n",bus.addr,bus.data);
            else
                $display("\t Randomization failed.\n");
        end
    end

    initial begin
        mailbox sm = new();
        string s;
        sm.put("hello");
        sm.get(s);
        $display("\t mailbox get string is %s",s);
    end
*/
    initial begin 
        #300 $finish;
    end 

   
endmodule
