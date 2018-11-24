`timescale 1ps/1ps

module multiplexor_11
(
input i_mul_uc, //salida de la uc y entrada del multiplexor 
input [31:0]i_uno,    //entrada en la posicion uno 
input [31:0]i_cero,     //entrada en la pocision 0 
output reg[31:0]o_multi
);
always @(*)
begin 
	if(i_mul_uc==1)
	begin
		o_multi=i_uno;
	end
	if(i_mul_uc==0)
	begin
		o_multi=i_cero;
	end 
end 
endmodule 