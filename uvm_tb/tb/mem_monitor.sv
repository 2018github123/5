// Monitor

class mem_monitor extends uvm_monitor;

	virtual mem_if vif;
	
	uvm_analysis_port #(mem_transaction) item_collected_port;
	
	mem_transaction trans_collected;
	
	/*code*/
	
	`uvm_component_utils(mem_monitor)
	
	function new(string name,uvm_component parent);
		super.new(name,parent);
		
		trans_collected = new("trans_collected");
		/*code*/
		
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual mem_if)::get(this,"","vif",vif)) begin
			`uvm_fatal("NO_VIF",{"Virtual interface must be set for:",get_full_name(),"vif"});
		end
		item_collected_port = new("item_collected_port",this);
	endfunction
	
	extern virtual task run_phase(uvm_phase phase);
	extern task collect_one_pkt(mem_transaction tr);

endclass

task mem_monitor::run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.MONITOR.clk);
      wait(vif.monitor_cb.wr_en || vif.monitor_cb.rd_en);
        trans_collected.addr = vif.monitor_cb.addr;
      if(vif.monitor_cb.wr_en) begin
        trans_collected.wr_en = vif.monitor_cb.wr_en;
        trans_collected.wdata = vif.monitor_cb.wdata;
        trans_collected.rd_en = 0;
        @(posedge vif.MONITOR.clk);
      end
      if(vif.monitor_cb.rd_en) begin
        trans_collected.rd_en = vif.monitor_cb.rd_en;
        trans_collected.wr_en = 0;
        @(posedge vif.MONITOR.clk);
        @(posedge vif.MONITOR.clk);
        trans_collected.rdata = vif.monitor_cb.rdata;
      end
      item_collected_port.write(trans_collected);
    end
endtask

task mem_monitor::collect_one_pkt(mem_transaction tr);
	////collect transaction
endtask
