`timescale 1ps/1ps

module memoria_de_datos_11
(
input i_w,
input i_r,
input [31:0]i_memoria,//dereccion que va a leer o guardar 
input [31:0]d_memoria,//dato que se va a guardar
output reg[31:0]o_memoria
);
reg [31:0]men_dat[31:0];
always @(*)
begin 
	if(i_r==1)//lectura 
	begin
		o_memoria=men_dat[i_memoria];
	end
	if(i_w==1)//escritura 
	begin
		men_dat[i_memoria]=d_memoria;
	end
end 
initial begin
	men_dat[0]=32'd0;
	men_dat[1]=32'd1;
	men_dat[2]=32'd2;
	men_dat[3]=32'd15;
	men_dat[4]=32'd4;
	men_dat[5]=32'd5;
	men_dat[6]=32'd6;
	men_dat[7]=32'd7;
	men_dat[8]=32'd8;
	men_dat[9]=32'd9;
	men_dat[10]=32'd10;
	men_dat[11]=32'd11;
	men_dat[12]=32'd12;
	men_dat[13]=32'd13;
	men_dat[14]=32'd14;
	men_dat[15]=32'd15;
	men_dat[16]=32'd16;
	men_dat[17]=32'd17;
	men_dat[18]=32'd18;
	men_dat[19]=32'd19;
	men_dat[20]=32'd20;
	men_dat[21]=32'd21;
	men_dat[22]=32'd22;
	men_dat[23]=32'd23;
	men_dat[24]=32'd24;
	men_dat[25]=32'd25;
	men_dat[26]=32'd26;
	men_dat[27]=32'd27;
	men_dat[28]=32'd28;
	men_dat[29]=32'd29;
	men_dat[30]=32'd30;
	men_dat[31]=32'd31;
end 
endmodule 