// Environment is container class contains Mailbox, Generator and Driver

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class env;

    //
    generator gen;
    driver driv;

    mailbox gen2driv;

    event gen_ended;

    virtual mem_interface mem_vif;

    function new (virtual mem_interface mem_vif);
        
        this.mem_vif = mem_vif;
        gen2driv = new();

        gen = new(gen2driv,gen_ended);
        driv = new(mem_vif,gen2driv);
    endfunction : new

    task pre_test();
        driv.reset();
    endtask : pre_test

    task test();
        fork
            gen.main();
            driv.main();

        join_any
    endtask : test

    task post_test();
        wait(gen_ended.triggered);
        wait(gen.repeat_count == driv.no_transactions);
    endtask : post_test

    task run();
        pre_test();
        test();
        post_test();
        $finish;
    endtask : run

endclass : env