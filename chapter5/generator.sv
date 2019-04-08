// generator class is responsible for ,
//          1. Generating the simulus by randomizing the transaction class
//          2. Sending the randomized class to driver

class generator;
    //
    rand transaction trans;

    mailbox gen2driv;

    int repeat_count;

    //event
    // adding event to indicate the completion of generation process,
    // event will be triggered on the completion of Generation process
    event ended;

    //
    function new(mailbox gen2driv,event ended);
        this.gen2driv = gen2driv;
        this.ended = ended;
    endfunction : new

    task main();

     repeat(repeat_count) begin

      trans = new();
      if( !trans.randomize()) begin
            /* code */
            $fatal("Gen:: trans randomization failed.");
        end  
       gen2driv.put(trans);

     end
     -> ended;
    
    endtask : main

endclass : generator