module leds(
    input logic[1:0] btn,
    output logic led1_b,
    output logic led1_g,
    output logic led1_r
);
    assign led1_b = btn[0];
    assign led1_g = btn[1];
    assign led1_r = 0;

endmodule