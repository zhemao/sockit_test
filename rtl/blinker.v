module blinker (
    clk,
    delay,
    led
);

input clk;
input [2:0] delay;

output reg [3:0] led;

reg [27:0] count;
reg [1:0] pos;
reg up;

always @(pos) begin
    case (pos)
        2'b00: led <= 4'b0001;
        2'b01: led <= 4'b0010;
        2'b10: led <= 4'b0100;
        2'b11: led <= 4'b1000;
    endcase
end

always @(posedge clk) begin
    if (count == 28'b0) begin
        count <= {delay, 25'h1ffffff};
        if (up) begin
            if (pos == 2'b11)
                up <= 1'b0;
            else
                pos <= pos + 1'b1;
        end else begin
            if (pos == 2'b00)
                up <= 1'b1;
            else
                pos <= pos - 1'b1;
        end
    end else begin
        count <= count - 1'b1;
    end
end

endmodule
