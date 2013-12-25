module delay_ctrl (
    clk,
    reset,

    faster,
    slower,
    delay,

    read,
    write,
    chipselect,
    writedata,
    readdata
);

input clk;
input faster;
input slower;
output [3:0] delay;
input reset;

input read;
input write;
input chipselect;
input [7:0] writedata;
output [7:0] readdata;

reg [3:0] delay_intern = 4'b1000;

assign delay = delay_intern;
assign readdata = {4'b0000, delay_intern};

always @(posedge clk) begin
    if (reset)
        delay_intern <= 4'b1000;
    else if (chipselect && write)
        delay_intern <= writedata[3:0];
    else if (faster && delay_intern != 4'b0001)
        delay_intern <= delay_intern - 1'b1;
    else if (slower && delay_intern != 4'b1111)
        delay_intern <= delay_intern + 1'b1;
end

endmodule
