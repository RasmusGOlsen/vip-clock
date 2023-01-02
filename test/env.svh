/*
    Class: env

    This class implements the test environment for the
    clock agent.
*/
class env extends uvm_env;

    `uvm_component_utils(env)

    clock::agent m_clock;


    function new(string name="test_clock::env", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_clock = clock::agent::type_id::create("m_clock", this);
    
    endfunction: build_phase


endclass: env
