//
class driver ;

    //used to count the number of transactions
    int no_transactions;

    //creating virtual interface handle
    virtual intf vif;

    //creating mailbox handle

    mailbox gen2driv;

    //constructor
    function new (virtual intf vif,mailbox gen2driv);
        //getting the interface
        this.vif = vif;
        //getting the mailbox handles from env
        this.gen2driv = gen2driv;
    endfunction : new

    //reset task
    task reset();
        wait(vif.reset);
        $display("[ DRIVER ] ------Reset Started------");
        vif.a <= 0;
        vif.b <= 0;
        vif.valid <= 0;
        wait(!vif.reset);
        $display("[ DRIVER ] -------Reset Ended-------");
    endtask : reset

    task main();
        forever begin
            transactions trans;
            gen2driv.get(trans);
            @(posedge vif.clk);
            vif.valid <= 1;
            vif.a <= trans.a;
            vif.b <= trans.b;
            @(posedge vif.clk);
            vif.valid <= 0;
            trans.c <= vif.c;
            @(posedge vif.clk);
            trans.display("[ Driver ]");
            no_transactions++;
        end
    endtask : main

endclass : driver