`timescale 1ps/1ps

module banco_registro_11
(
input [4:0]dato_1,// o rs
input [4:0]dato_2,// o rt
input [4:0]direccion,//o aw donde se va a escribir 
input  w_r,//0 escritura    1 lectura que sale de la uc
input [31:0]dato,//el dato que se ecribe
output reg [31:0]salida_1,
output reg [31:0]salida_2
);
reg [31:0] men_[31:0];
always @(*)
begin 
	if(w_r==0)//escribir
	begin
		men_[direccion]=dato;
		salida_1=men_[dato_1];
		salida_2=men_[dato_2];
	end
	
	else
	begin
		salida_1=men_[dato_1];
		salida_2=men_[dato_2];
	end
end 
initial begin
	men_[0]=32'd3;//puntero de la memoria de datos 
	men_[1]=32'd1;
	men_[2]=32'd2;
	men_[3]=32'd4;
	men_[4]=32'd6;
	men_[5]=32'd8;
	men_[6]=32'd9;
	men_[7]=32'd10;
	men_[8]=32'd12;
	men_[9]=32'd14;
	men_[10]=32'd1;
	men_[11]=32'd2;
	men_[12]=32'd3;
	men_[13]=32'd4;
	men_[14]=32'd5;
	men_[15]=32'd6;
	men_[16]=32'd7;
	men_[17]=32'd8;
	men_[18]=32'd9;
	men_[19]=32'd10;
	men_[20]=32'd11;
	men_[21]=32'd12;
	men_[22]=32'd13;
	men_[23]=32'd14;
	men_[24]=32'd3;
	men_[25]=32'd6;
	men_[26]=32'd9;
	men_[27]=32'd12;
	men_[28]=32'd15;
	men_[29]=32'd18;
	men_[30]=32'd0;
	men_[31]=32'd1;
end
endmodule 