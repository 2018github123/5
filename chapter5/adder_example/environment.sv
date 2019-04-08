//

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;

    generator gen;
    driver    driv;

    monitor   mon;
    scoreboard scb;

    mailbox   gen2driv;
    mailbox   mon2scb;

    virtual intf  vif;

    function new (virtual intf vif);
        //get the interface from test
        this.vif = vif;
        //
        gen2driv = new();
        mon2scb = new();
        //
        gen = new(gen2driv);
        driv = new(vif,gen2driv);
        mon = new(vif,mon2scb);
        scb = new(mon2scb);

    endfunction : new

    task pre_test();
        driv.reset();
    endtask : pre_test

    task test();
        fork
            gen.main();
            driv.main();
            mon.main();
            scb.main();
        join_any
    endtask : test

    task post_test();
        wait(gen.ended.triggered);
        wait(gen.repeat_count == driv.no_transactions);
        wait(gen.repeat_count == scb.no_transactions);
    endtask : post_test

    // run task

    task run();
        pre_test();
        test();
        post_test();
        $finish;
    endtask : run

endclass : environment