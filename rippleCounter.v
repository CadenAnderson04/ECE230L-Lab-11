`timescale 1ns/1ps

module rippleCounter (
    input Clock, Reset,
    output stageOne,stageTwo,stageThree 
);

tff stage1 (
.T(1'b1),
.Clock(Clock),
.Reset(Reset),
.Q(stageOne)
);

tff stage2(
.T(1'b1),
.Clock(stageOne),
.Reset(Reset),
.Q(stageTwo)
);

tff stage3(
.T(1'b1),
.Clock(stageTwo),
.Reset(Reset),
.Q(stageThree)
);

endmodule

module tff(
    input T, Clock, Reset,
    output reg Q, 
    output notQ
    );
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock) begin
        if (Clock)
            if (Reset)
                Q <= 1'b0;
            else if (T) begin
                Q <= ~Q;
            end 
        end

    assign notQ = ~Q;
    
endmodule