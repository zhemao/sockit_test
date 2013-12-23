module delay_ctrl (
    clk,
    ctrl_key,
    delay
);

input clk;
input [1:0] ctrl_key;
output [2:0] delay;

wire faster = ctrl_key[1];
wire slower = ctrl_key[0];

reg [2:0] delay_intern = 3'b001;

assign delay = delay_intern;

always @(posedge clk) begin
    if (faster && delay_intern != 3'b001) begin
        delay_intern <= delay_intern - 1'b1; 
    end else if (slower && delay_intern != 3'b111) begin
        delay_intern <= delay_intern + 1'b1;
    end
end

endmodule
