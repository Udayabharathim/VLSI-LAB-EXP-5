module fsm(clk,rst,x,z);
input clk,rst,x;
output z;
reg [2:1] ps,ns;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always@(x,posedge clk)
case(ps)
s0:if(x)
ns=s1;
else
ns=s0;
s1:if(x)
ns=s1;
else
ns=s2;
s2:if(x)
ns=s3;
else
ns=s0;
s3:if(x)
ns=s1;
else
ns=s0;
endcase
always@(posedge clk)
if(rst)
ps<=s0;
else
ps=ns;
assign z=(ps==s3);
endmodule
