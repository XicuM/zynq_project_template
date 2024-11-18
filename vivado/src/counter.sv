`timescale 1ns/1ps

module counter (
    input logic clk,
    input logic rst,
    input logic en,
    output reg [3:0] count
);

    always @(posedge clk) begin
        if (rst) begin count <= 4'b0; end 
        else if (en) begin count <= count + 1; end
    end

endmodule