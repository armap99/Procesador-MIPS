`timescale 1ps/1ps

module alu_11
(
input [31:0]bit_1,
input [31:0]bit_2,
input [2:0]switch,
output reg [31:0]out,
output  reg ZF
);
always @(*)

begin 

	case (switch)
	3'b000:
		begin out=bit_1 + bit_2; end //suma
	3'b001:
		begin out=bit_1 - bit_2; end //resta
	3'b010:
		begin out=bit_1 * bit_2; end //multiplicacion
	3'b011:
		begin out=bit_1 / bit_2; end //division
	3'b100:
		begin out=bit_1 & bit_2; end //and
	3'b101:
		begin out=bit_1 | bit_2; end //or
	3'b110:
		begin out=bit_1 ^ bit_2; end //xor
	3'b111:
		begin out=~(bit_1 | bit_2); end //nor
	endcase
	begin
	if(out==0)
		ZF=1;
	else
		ZF=0;	
end 
end
endmodule 