`timescale 1ns / 1ps

module tb;

    // Testbench Signals
    reg clk;
    reg rstn;
    wire clk_div3;
    wire clk_div3_50;

    // Instantiate the Unit Under Test (UUT)
    oddfrequencydivider uut (
        .clk(clk),
        .rstn(rstn),
        .clk_div3(clk_div3),
        .clk_div3_50(clk_div3_50)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
  end

    // Test sequence
    initial begin
        // Initialize Inputs
        rstn = 0; // Assert reset
        #100; // Wait 100ns for global reset
        
        rstn = 1; // Deassert reset
        #400; // Run for 1000ns to observe behavior

        $finish; // End simulation
    end

endmodule
