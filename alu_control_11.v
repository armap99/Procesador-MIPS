`timescale 1ps/1ps

module alu_control_11
(
input [2:0]i_aluc,//entrada de uc
input [5:0]i_fun,//entrada de la funcion 
output reg[2:0]o_aluc//lo que va a entrar en la selectora 
);
always @(*)
begin 
	if(i_aluc==000)//para intricciones tipo r
	begin
		case (i_fun)//porque las r pasan una fincion 
		6'b00001:
			begin o_aluc=3'b000; end //suma
		6'b00010:
			begin o_aluc=3'b001; end //resta
		6'b00011:
			begin o_aluc=3'b100; end //and
		6'b00100:
			begin o_aluc=3'b101; end //or
		endcase
	end
	if(i_aluc==001)//para intrucciones tipo i que no necesita la funcion
	begin          //para lw, sw y adi
		o_aluc=3'b000;//suma
	end
	
	if(i_aluc==100)//para intrucciones tipo i que no necesita la funcion
	begin          //para ori
		o_aluc=3'b101;//or
	end
	
	if(i_aluc==011)//para intrucciones tipo i que no necesita la funcion
	begin          //para andi
		o_aluc=3'b100;//and
	end
end 
endmodule 