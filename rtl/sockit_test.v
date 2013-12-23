module sockit_test (
    CLOCK_50,
    KEY,
    LED
);

input CLOCK_50;
input [3:0] KEY;

output [3:0] LED;

wire [3:0] key_os;
wire [2:0] delay;
wire main_clk = CLOCK_50;

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : OS
        oneshot os (
            .clk (main_clk),
            .edge_sig (KEY[i]),
            .level_sig (key_os[i])
        );
    end
endgenerate

delay_ctrl dc (
    .clk (main_clk),
    .ctrl_key (key_os[1:0]),
    .delay (delay)
);

blinker b (
    .clk (main_clk),
    .delay (delay),
    .led (LED)
);

endmodule
