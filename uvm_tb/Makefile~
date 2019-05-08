.PHONY: clean all

TB_DIR = ./tb
RTL_DIR = ./rtl
INCLUDE_DIR = ./include



TIMESCALE = $(INCLUDE_DIR)/timescale.sv
TEST_TB = $(TB_DIR)/*.sv
RTL = $(RTL_DIR)/*.v
TOP = $(TB_DIR)/*.v

all: clean run

run: comp_tb sim

comp_dut:

	@echo "compile dut"
	@if [ ! -e  "$(RTL_DIR)/can_simv" ] ; then \
	(echo "$(RTL_DIR)/can_simv has not existed !" ;  \
	vcs +incdir+$(RTL_DIR) $(RTL) -full64 -o $(RTL_DIR)/can_simv ; )  \
	else  \
	(echo "$(RTL_DIR)/can_simv has existed !" ; ) \
	fi
	
comp_tb: 
	@#vcs source.v -cm fsm -o mysimv
	@#vcs -cm tgl -cm_dir /net/designl/mycm source.v
	@vcs -sverilog -timescale=1ns/1ps -ntb_opts uvm-1.1  +incdir+$(RTL_DIR) $(RTL) -F list -l comp.log -full64  
	@#vcs -sverilog   +incdir+$(INCLUDE_DIR) $(TIMESCALE) -F list -l comp.log -full64 

sim: 
	@./simv -l run.log 
   
	@if [ -d simv.vdb ] ; then \
	 (urg -dir simv.vdb -report text ; ) \
	 fi

dut_clean:
	@rm -rf $(RTL_DIR)/can_simv*
clean:
	@rm -rf simv* csrc* *.log urgReport  text  ucli.key 
	



