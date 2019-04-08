// test:
//      1. creating the environment
//      2. configuring the testbench
//      3. initiating the stimulus driving
`include "env.sv"
program test(mem_interface mem_inf);
    env mem_env;

    initial begin
        mem_env = new(mem_inf);
        mem_env.gen.repeat_count = 10;
        mem_env.run();
    end
endprogram