/*
    Class: env_config

    This is the configuration class for the test
    environment for the clock agent.
*/
class env_config extends uvm_object;

    `uvm_object_utils(env_config)

    clock::configuration m_clock_config;

    
    function new(string name="test_clock::env_config");
        super.new(name);
    endfunction: new


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_clock_config = clock::configuration::type_id::create("m_clock_config");

    endfunction: build_phase

endclass: env_config
