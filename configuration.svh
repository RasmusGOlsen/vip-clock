/*
    Class: config

    This class defines the configuration for the clock agent.
*/
class configuration extends uvm_object;

    `uvm_object_utils(clock::configuration)

    uvm_active_passive_enum is_active = UVM_ACTIVE;
    state_e init_state = RUNNING;

    rand time period = 10ns;
    rand float duty_cycle = 0.5;
    rand bit init_value = 0;
    rand time jitter = 0;
    rand time skew = 0;
    rand time drift = 0;
    rand time uncertainty = 0;
    
    
    function new(string name="clock::configuration");
        super.new(name);
    endfunction: new

endclass: configuration
