// driver class:
//          receive the simulus generated from generator and drive to DUT
//          by assigning transaction class values to interface signals

class driver;
    // used to count the num. of trans
    int no_transactions;
    //creating virtual interface handle
    virtual mem_interface mem_vif;
    //creating mailbox handle
    mailbox gen2driv;
    //
    function new(virtual mem_interface mem_vif,mailbox gen2driv);
        this.mem_vif = mem_vif;
        this.gen2driv = gen2driv;
    endfunction : new

    `define DRIV_IF mem_vif.DRIVER.driver_cb

    task reset();
        wait(mem_vif.reset);
        $display("---------[DRIVER] reset started--------");
        `DRIV_IF.wr_en <= 0;
        `DRIV_IF.rd_en <= 0;
        `DRIV_IF.addr <= 0;
        `DRIV_IF.wdata <= 0;
        wait(!mem_vif.reset);
        $display("---------[DRIVER] reset ended--------");
    endtask : reset
    //
    //drive the transaction packet to interface signal
    task drive();
        forever begin
            transaction trans;
            `DRIV_IF.wr_en <= 0;
            `DRIV_IF.rd_en <= 0;
            gen2driv.get(trans);
            $display("----------[DRIVER-TRANSFER: %0d]-------",no_transactions);
            @(posedge mem_vif.DRIVER.clk);
            `DRIV_IF.addr <= trans.addr;
            if(trans.wr_en) begin
                /* code */
                `DRIV_IF.wr_en <= trans.wr_en;
                `DRIV_IF.wdata <= trans.wdata;
                $display("\tADDR = %0h  \tWDATA = %0h",trans.addr,trans.wdata);
                @(posedge mem_vif.DRIVER.clk);
            end
            if(trans.rd_en) begin
                /* code */
                `DRIV_IF.rd_en <= trans.rd_en;
                @(posedge mem_vif.DRIVER.clk);
                `DRIV_IF.rd_en <= 0;
                @(posedge mem_vif.DRIVER.clk);
                trans.rdata = `DRIV_IF.rdata;
                $display("\tADDR = %0h  \tRDATA = %0h",trans.addr,`DRIV_IF.rdata);
            end

            $display("---------------------------------------------------------");
            no_transactions++;

        end
    endtask : drive

endclass : driver