`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2025 12:11:54 PM
// Design Name: 
// Module Name: tb
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


`timescale 1ns/1ps

module tb_booth_radix4_multiplier;

    parameter N = 8;

    reg  signed [N-1:0] multiplicand;
    reg  signed [N-1:0] multiplier;
    wire signed [2*N-1:0] product;

    booth_radix4_multiplier #(N) dut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        multiplicand = 8'sd5;   multiplier = 8'sd3;    #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = -8'sd5;  multiplier = 8'sd3;    #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = 8'sd5;   multiplier = -8'sd3;   #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = -8'sd5;  multiplier = -8'sd3;   #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = 8'sd12;  multiplier = 8'sd7;    #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = -8'sd8;  multiplier = 8'sd4;    #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = 8'sd127; multiplier = 8'sd2;    #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);

        multiplicand = -8'sd128; multiplier = -8'sd1;   #5;
        $display("A=%0d  B=%0d  Product=%0d", multiplicand, multiplier, product);
        $finish;
    end

endmodule


