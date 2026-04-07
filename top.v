`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2026 09:21:31 AM
// Design Name: 
// Module Name: top
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


module top(
    input btnU, btnC,
    output [6:0] led
    );
    
    rippleCounter ripple (
    .Reset(btnU),
    .Clock(btnC),
    .stageOne(led[0]),
    .stageTwo(led[1]),
    .stageThree(led[2])
    );
    
    moduloDivider modulo (
    .Clock(btnC),
    .Reset(btnU),
    .stageOne(led[3]),
    .stageTwo(led[4]),
    .stageThree(led[5]),
    .finalQ(led[6])
    );
    
    
endmodule
