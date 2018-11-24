`timescale 1ps/1ps

module concatenador 
(
input [15:0]i_con,
output reg[31:0]o_con
); 
reg [31:0]con;//lo que se le va agregaar 0000000 o 100000
reg [15:0]qui;//para poderle quitar el signo 
always @(*)
begin 
	if(i_con[15]==0)
	begin
		con=16'd0;
		o_con={con,i_con};
	end
	if(i_con[15]==1)
	begin
		qui=i_con;
		qui[15]=0;//para quitarle el signo
		con=16'd1000000000000000;
		o_con={con,qui};
	end
end 
endmodule 