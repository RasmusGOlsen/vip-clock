/*
    Class: sequence

    This is the base sequence for the clock agent.
*/
class base_sequence extends uvm_sequence#(sequence_item);

    `uvm_object_utils(clock::base_sequence)

    rand sequence_item m_sequence_item;

    function new(string name="clock::sequence");
        super.new(name);
    endfunction: new

    
    virtual task body();
        
        this.wait_for_grant();
        if (this.req == null) begin
            this.req = sequence_item::type_id::create("req");
            if (!this.req.randomize()) begin
                `uvm_fatal(this.get_full_path(), "Randomization failed!")
            end
        end
        this.send_request(this.req);
        this.wait_for_item_done();
        get_response(this.req);

    endtask: body

endclass: base_sequence
