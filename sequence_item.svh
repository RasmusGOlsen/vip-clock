class sequence_item extends uvm_sequence_item;

    `uvm_object_utils(clock::sequence_item)

    rand state_e state;

    function new(string name="clock::sequence_item");
        super.new(name);
    endfunction: new

endclass: sequence_item
