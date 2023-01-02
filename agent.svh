/*
    Class: agent

    This class implements a clock agent
*/
class agent extends uvm_agent;

    `uvm_component_utils(clock::agent)

    configuration m_configuration;
    driver        m_driver;
    sequencer     m_sequencer;


    function new(string name="clock::agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        
        this.m_configuration = configuration::type_id::create("m_configuration");
        this.get_configuration();

        if (this.get_is_active()) begin
            this.m_driver        = driver::type_id::create("m_driver", this);
            this.m_sequencer     = sequencer::type_id::create("m_sequencer", this);
            this.set_configuration("m_driver");
            this.set_configuration("m_sequencer");
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


    protected virtual function void get_configuration();
        if (!uvm_config_db#(configuration)::get(this, "", this.m_configuration.get_type_name(), this.m_configuration)) begin
            `uvm_fatal(this.get_full_name(), "Cannot find configuration!")
        end
    endfunction: get_configuration


    protected virtual function void set_configuration(string child);
        uvm_config_db#(configuration)::set(this, child, this.m_configuration.get_type_name(), this.m_configuration);
    endfunction: set_configuration


endclass: agent
