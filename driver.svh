/*
    Class: driver

    This class implements the driver.
*/
class driver extends uvm_driver;

    `uvm_component_utils(clock::driver)

    configuration m_configuration;

    function new(string name="clock::driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

    endfunction: build_phase


    virtual task run_phase(uvm_phase phase);
        this.m_configuration.vif.clock = this.m_configuration.init_value;
        forever begin
            if (m_configuration.state == RUNNING) begin
                if (this.seq_item_port.try_next_item(this.req) != null) begin
                    // update state
                    this.seq_item_port.item_done();
                end
                this.drive(m_configuration.vif);
            end else begin
                this.seq_item_port.get_next_item(this.req);
                // update state
                this.seq_item_port.item_done();
            end
        end

    endtask: run_phase


    virtual task drive(virtual clock_if vif);
        #(this.m_configuration.period * this.m_configuration.duty_cycle);
        vif.clock = ~vif.clock;
        #(this.m_configuration.period * (1 - this.m_configuration.duty_cycle));
        vif.clock = ~vif.clock;
    endtask: drive
    

endclass: driver
