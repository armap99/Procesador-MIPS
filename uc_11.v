`timescale 1ps/1ps

module uc_11
(
input [5:0]op,
output reg uc_mul, //activacion de multiplexor del final 1 alu 0 memoria de datos
output reg uc_mul_2, //activacion de multiplexor de la entarada de banco 0 para intrucciones i 1 para r
output reg uc_mul_3, //activacion de multiplexor de alu 0 para tipo r 1 para tipo 1
output reg[2:0]sec_alu,//selectora de alu
output reg w, //escribir memoria de datos
output reg r, //lectura de memoria de datos 
output reg w_r //leer o escribir banco de registros
);
always @(*)
begin 
	case(op)
	6'b000000://suma resta or and 
		begin
			w_r=1'b0;//para leer banco de registro
			sec_alu=3'b000;//selectora suma
			uc_mul_2=1'b1;//para que sea de tipo r y rd sea el 15:11
			uc_mul_3=1'b0;//para que la salida de la memoria entre a la alu
			w=1'b0;  //no lee ni guarda nada la memoria de datos
			r=1'b0;  //
			uc_mul=1'b1; //activacion de salida de alu en multiplexor
			//#20
			//w_r=1'b0;//para que escriba el dato que se va a sacar 
		end
	
	6'b100110://lw cargar dato o sacar 
		begin
			w_r=1'b0;//simpre va a leer es muy estudioso
			sec_alu=3'b001;// selectora alu va a saber que es i y va a hacer una suma
			uc_mul_2=1'b0;//para que en lugar de rt sea rd 
			uc_mul_3=1'b1;//para que tome el valor inmediato 
			w=1'b0; //no se escribe nada
			r=1'b1; //se lee el dato que se quiera sacar
			uc_mul=1'b0; //para que salga lo de la memoria 
			//#20
			//w_r=1'b0;//lo guarda 
		end
	
	6'b101011://sw para escribir un dato del banco a la memoria  
		begin
			w_r=1'b1;//simpre va a leer es muy estudioso
			sec_alu=3'b001;// selectora alu va a saber que es i y va a hacer una suma
			uc_mul_2=1'b0;//para que en lugar de rt sea rd pero pude 
			uc_mul_3=1'b1;//para que tome el valor inmediato 
			w=1'b1; //se escribe el dato a guardar
			r=1'b0; //no se va a leer nada
			uc_mul=1'b0; //para que salga lo de la meoria 
		end
	
	6'b001000://addi
		begin
			w_r=1'b0;//simpre va a leer es muy estudioso
			sec_alu=3'b001;// selectora alu va a saber que es i y va a hacer una suma
			uc_mul_2=1'b0;//para que en lugar de rt sea rd 
			uc_mul_3=1'b1;//para que tome el valor inmediato 
			w=1'b0; //no se escribe nada
			r=1'b0; //no se lee nada
			uc_mul=1'b1; //para que salga lo de la alu 
			//#20
			//w_r=1'b0;//lo guarda 
		end
		
	6'b001101://andi 
		begin
			w_r=1'b0;//simpre va a leer es muy estudioso
			sec_alu=3'b011;// selectora alu va a saber que es i y va a hacer una and
			uc_mul_2=1'b0;//para que en lugar de rt sea rd 
			uc_mul_3=1'b1;//para que tome el valor inmediato 
			w=1'b0; //no se escribe nada
			r=1'b0; //no se lee nada
			uc_mul=1'b1; //para que salga lo de la alu 
			//#20
			//w_r=1'b0;//lo guarda 
		end
		
	6'b001100://ori 
		begin
			w_r=1'b0;//simpre va a leer es muy estudioso
			sec_alu=3'b100;// selectora alu va a saber que es i y va a hacer una or
			uc_mul_2=1'b0;//para que en lugar de rt sea rd 
			uc_mul_3=1'b1;//para que tome el valor inmediato 
			w=1'b0; //no se escribe nada
			r=1'b0; //no se lee nada
			uc_mul=1'b1; //para que salga lo de la alu 
			//#20
			//w_r=1'b0;//lo guarda 
		end
	endcase
end 
endmodule 