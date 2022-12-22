package clock;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    typedef sequence_item;
    typedef base_sequence;
    typedef configuration;
    typedef driver;
    typedef agent;
    typedef uvm_sequencer#(sequence_item) sequencer;
    typedef enum bit {STOPPED=0, RUNNING=1} state_e;

    `include "sequence_item.svh"
    `include "sequence.svh"
    `include "configuration.svh"
    `include "driver.svh"
    `include "agent.svh"

endpackage: clock
