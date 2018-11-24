`timescale 1ps/1ps

module tb_ins_11;
reg [31:0]code;
wire zero;

ins_11 tb_ins_11(
.codigo(code[31:0]),
.cero(zero)
);
//generacion de estimulos 
initial begin 
	code=32'b00000000001000101111100000000001;//suma 1+2 y lo guarada en el 31
	#100;
	
	code=32'b00000000000000011111000000000001;//suma 3+1 y lo guarda en el 30
	#100;
	
	code=32'b00000000000000101110100000000001;//suma 3+2 y lo guarda en el 29
	#100;
	
	code=32'b00000000010000011110000000000010;//resta 2-1 y lo guarda en el 28
	#100;
	
	code=32'b00000000000000011101100000000010;//resta 3-1 y lo guarda en el 27
	#100;
	
	code=32'b00000000000000101101000000000010;//resta 3-2 y lo guarda en el 26
	#100;
	
	code=32'b00000000001000101100100000000011;//and de 1&2 y lo guarda en el 25
	#100;
	
	code=32'b00000000000000011100000000000011;//and de 3&1 y lo guarda en el 24
	#100;
	
	code=32'b00000000000000101011100000000011;//and de 3&2 y lo guarda en el 23
	#100;
	
	code=32'b00000000001000101011000000000100;//or de 1|2 y lo guarda en el 22
	#100;
	
	code=32'b00000000000000011010100000000100;//or de 3|1 y lo guarda en el 21
	#100;
	
	code=32'b00000000000000101010000000000100;//or de 3|2 y lo guarda en el 20
	#100;
	
	code=32'b10011000000100110000000000000000;//lw carga dato del puntero que es 15 y el puntero enta colocado en el 3 y lo guarda en el 19 
	#100;
	
	code=32'b10011000000100100000000000000001;//lw carga el dato despues del puntero que es 4 y lo guarda en el 18 
	#100;
	
	code=32'b10011000000100010000000000000010;//lw carga dos despues del puntero que es 5 y lo guarda en el 17
	#100;
	
	code=32'b10101100000000010000000000000011;//sw guarda el registro uno(1) en el 6
	#100;
	
	code=32'b10101100000000100000000000000100;//sw guarda el registro dos(2) en el 7
	#100;
	
	code=32'b10101100000000110000000000000101;//sw guarda el registro tres(4) en el 8
	#100;
	
	code=32'b00100000001100000000000000000001;//addi sumae registro uno(1) con uno y guardar en el 16
	#100;
	
	code=32'b00100000001011110000000000000010;//addi sumae registro uno(1) con dos y guardar en el 15
	#100;
	
	code=32'b00100000001011100000000000000011;//addi sumae registro uno(1) con tres y guardar en el 14
	#100;
	
	code=32'b00110000001011010000000000000001;//ori or del registro uno(1) con el uno y lo guarda en al 13
	#100;
	
	code=32'b00110000001011000000000000000010;//ori or del registro uno(1) con el dos y lo guarda en al 12
	#100;
	
	code=32'b00110000001010110000000000000011;//ori or del registro uno(1) con el tres y lo guarda en al 11
	#100;
	
	code=32'b00110100001010100000000000000001;//andi and del registro uno(1) con el 1 y lo guarda en el 10
	#100;
	
	code=32'b00110100001010010000000000000010;//andi and del registro uno(1) con el 2 y lo guarda en el 9
	#100;
	
	code=32'b00110100001010000000000000000011;//andi and del registro uno(1) con el 3 y lo guarda en el 8
	#100;
	
	$stop;
end 
endmodule 