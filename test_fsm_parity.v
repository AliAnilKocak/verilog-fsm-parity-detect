module test_fsm_parity();
reg clock, reset, x;
wire parity;

initial begin
  
  clock = 0;
  reset = 0;
  x = 0;
 
  #10 reset = 1;
  #30 reset = 0;
  #10 x = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 1;

  
  #10 $finish;
end

always begin
 #5 clock = !clock;
end

fsm_parity U0 (
.clock (clock),
.reset (reset),
.x (x),
.parity (parity)
);

endmodule





























