`timescale 1ns/1ps

module moduloDivider (
    input Clock, Reset,
    output stageOne,stageTwo,stageThree, finalQ
);

wire reset_trigger;
assign reset_trigger = (~stageOne && stageTwo && stageThree);
wire total_reset;
assign total_reset = reset_trigger | Reset;

wire [2:0] YToD;
wire [2:0] CinToCout;

fullAdder bitZeroAdder (
.A(stageOne),
.B(1'b1),
.Cin(1'b0),
.Y(YToD[0]),
.Cout(CinToCout[0])
);
dff bitZeroFlop (
.D(YToD[0]),
.Clock(Clock),
.Reset(total_reset),
.Q(stageOne)
);

fullAdder bitOneAdder (
.A(stageTwo),
.B(1'b0),
.Cin(CinToCout[0]),
.Y(YToD[1]),
.Cout(CinToCout[1])
);
dff bitOneFlop (
.D(YToD[1]),
.Clock(Clock),
.Reset(total_reset),
.Q(stageTwo)
);

fullAdder bitTwoAdder (
.A(stageThree),
.B(1'b0),
.Cin(CinToCout[1]),
.Y(YToD[2]),
.Cout(CinToCout[2])
);
dff bitTwoFlop (
.D(YToD[2]),
.Clock(Clock),
.Reset(total_reset),
.Q(stageThree)
);

tff FinalFlop (
.T(reset_trigger),
.Clock(Clock),
.Reset(Reset),
.Q(finalQ)
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
    
    always @(posedge Clock, posedge Reset) begin
            if (Reset)
                Q <= 1'b0;
            else if (T) begin
                Q <= ~Q;
            end 
        end

    assign notQ = ~Q;
    
endmodule

module dff(
    input D, Clock, Reset,
    output reg Q, 
    output notQ
    );
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock) begin
        if (Reset)
            Q <= 1'b0;
        else
            Q <= D;
        end
        
    assign notQ = ~Q;
    
endmodule

module fullAdder (
    input A,B, Cin,
    output Y, Cout
);

assign Y = ~A&B&~Cin | A&B&Cin | A&~B&~Cin | ~A&~B&Cin;
assign Cout = Cin&(A | B) | A&B;

endmodule