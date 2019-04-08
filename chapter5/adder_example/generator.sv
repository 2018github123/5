//Generator:
//      1. Generating the stimulus by randomizing the transaction class
//      2. sending the randomized class to driver

class generator ;
    //
    rand transaction trans;

    //
    mailbox gen2driv;
    //
    int repeat_count;

    //
    event ended;

    //constructor
    function new (mailbox gen2driv);
        //getting the mailbox handle from env
        this.gen2driv = gen2driv;
    endfunction : new

    //main task
    task main();
        //
        repeat(repeat_count) begin
            trans = new();
            if(!trans.randomize()) begin
                /* code */
                $fatal("Gen::trans randomization failed");
            end
            gen2driv.put(trans);
        end
        -> ended; //
    endtask : main
    
endclass : generator