/*
    Class: test

    This class implenments the base test class for the 
    clock test environment.
*/
class test extends uvm_test;

    `uvm_component_utils(test)

    env           m_env;
    env_config    m_config;

    function new(string name="test_clock::test", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_env = env::type_id::create("m_env", this);

        uvm_config_db#(virtual clock_if)::get(null, "uvm_top_test", "clock_if", )

    
    endfunction: build_phase


endclass: test
