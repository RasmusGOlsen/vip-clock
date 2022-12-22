/*
    Class: agent

    This class implements a clock agent
*/
class agent extends uvm_agent;

    `uvm_component_utils(clock::agent)

    configuration m_configuration;
    driver        m_driver;
    monitor       m_monitor;
    sequencer     m_sequencer;


    function new(string name="clock::agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        
        this.m_configuration = configuration::type_id::create("m_configuration");
        this.m_monitor       = monitor::type_id::create("m_monitor", this);
        
        if (this.get_is_active()) begin
            this.m_driver        = driver::type_id::create("m_driver", this);
            this.m_sequencer     = sequencer::type_id::create("m_sequencer", this);
        end

    endfunction: build_phase


    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    
        if (this.get_is_active()) begin
            this.m_driver.seq_item_port.conntect(m_sequencer.seq_item_port);
        end
    
    endfunction: connect_phase


    virtual function uvm_active_passive_enum get_is_active();
        return this.m_configuration.is_active;
    endfunction: get_is_active


endclass: agent
