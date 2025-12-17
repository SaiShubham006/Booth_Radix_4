`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2025 12:03:44 PM
// Design Name: 
// Module Name: booth_4_rad
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module booth_radix4_multiplier #(parameter N = 8) (
    input  signed [N-1:0] multiplicand,
    input  signed [N-1:0] multiplier,
    output reg signed [2*N-1:0] product
);

    localparam G   = (N + 1) / 2;
    localparam YW  = 2*G + 1;
    localparam PAD = 2*G - N;

    integer i;
    reg signed [YW-1:0] y;

    reg signed [2*N:0] acc, partial, shifted;
    reg [2:0] trip;

    always @(*) begin
        y   = { {PAD{multiplier[N-1]}}, multiplier, 1'b0 };
        acc = 0;

        for (i = 0; i < G; i = i + 1) begin
            trip = { y[2*i+2], y[2*i+1], y[2*i] };

            case (trip)
                3'b000, 3'b111: partial = 0;
                3'b001, 3'b010: partial = multiplicand;
                3'b011:         partial = multiplicand <<< 1;
                3'b100:         partial = -(multiplicand <<< 1);
                3'b101, 3'b110: partial = -multiplicand;
            endcase

            shifted = partial <<< (2*i);
            acc = acc + shifted;
        end

        product = acc[2*N-1:0];
    end
endmodule
