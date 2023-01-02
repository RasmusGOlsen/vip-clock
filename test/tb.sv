module tb;

    clock_if clock_vif();

    initial begin
        uvm_pkg::uvm_config_db#(virtual clock_if)::set(null, "uvm_test_top", "clock_if", clock_vif);


        uvm_pkg::run_test("test");
        $finish();
    end

endmodule
