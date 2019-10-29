module fsm_parity(clock, reset, x, parity);
input  clock;
input  reset;
input  x;
output reg parity;
reg state, nextstate;
parameter S0=0, S1=1;

always @(posedge clock or posedge reset) 
begin
	if (reset)
		state <= S0;
	else
	state <= nextstate;
end
always @(state) 
begin
	case(state)
		S0: parity = 0;
		S1: parity = 1;
	endcase
end
always @(state or x) 
begin
	nextstate = S0;
	case(state)
		S0: if(x)
		nextstate = S1;
		S1: if(!x)
		nextstate = S1;
	endcase
end
endmodule
