module delay_ctrl (
    clk,
    ctrl_key,
    delay
);

input clk;
input [1:0] ctrl_key;
output [3:0] delay;

wire faster = ctrl_key[1];
wire slower = ctrl_key[0];

reg [3:0] delay_intern = 4'b0100;

assign delay = delay_intern;

always @(posedge clk) begin
    if (faster && delay_intern != 4'b0001) begin
        delay_intern <= delay_intern - 1'b1; 
    end else if (slower && delay_intern != 4'b1111) begin
        delay_intern <= delay_intern + 1'b1;
    end
end

endmodule
