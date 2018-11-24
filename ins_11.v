`timescale 1ps/1ps

module ins_11
(
input [31:0]codigo,
output cero
);
wire w_uc_mul;//salida de la uc al ultimo multiplexor
wire w_uc_mul2;//salida de la uc al segundo multiplexor
wire w_uc_mul3;//salida de la uc al tercer multiplexor 
wire [2:0]w_uc_aluc;//salida de la uc a la alu control es la selectora
wire w_uc_menw;//salida de la uc a la meroria para escribir
wire w_uc_menr;//salida de la uc a la meroria para leer
wire w_uc_banco;//salida de la uc al banco de registros para leer y escribir
wire [4:0]w_mul2_ban;//salida de multiplexor 2 y entrada a el banco
wire [31:0]w_mul_ban;//salida del ultimo multiplexor y entrada de dato de banco
wire [31:0]w_salida1;//salida del primer dato del banco
wire [31:0]w_salida2;//salida del segundo dato del banco
wire [31:0]w_con_mul3;//salida del concatenador al multiplexor 3
wire [31:0]w_mul3_alu;//salida del multiplexor3 a la alu
wire [2:0]w_aluc_alu;//salida de la alu control a la selectora de la alu
wire [31:0]w_alu_mem;//salida de la alu al memoria de datos
wire [31:0]w_ban_mul;
//unidad de contol 
uc_11 in_uc_11(
.op(codigo[31:26]),
.uc_mul(w_uc_mul), //activacion de multiplexor del final 1 alu 0 memoria de datos
.uc_mul_2(w_uc_mul2), //activacion de multiplexor de la entarada de banco 0 para intrucciones i 1 para r
.uc_mul_3(w_uc_mul3), //activacion de multiplexor de alu 0 para tipo r 1 para tipo 1
.sec_alu(w_uc_aluc[2:0]),//selectora de alu
.w(w_uc_menw), //escribir memoria de datos
.r(w_uc_menr), //lectura de memoria de datos 
.w_r(w_uc_banco) //leer o escribir banco de registros
);
//multiplexor dos
multiplexor_11_2 ins_mul_2(
.i_mul_uc(w_uc_mul2), //salida de la uc y entrada del multiplexor 
.i_uno(codigo[15:11]),    //entrada en la posicion uno 
.i_cero(codigo[20:16]),     //entrada en la pocision 0 
.o_multi(w_mul2_ban[4:0])//salida del segundo multiplexor y entrada de banco de reg
);
//banco de registros
banco_registro_11 ins_banco_registro_11(
.dato_1(codigo[25:21]),// o rs
.dato_2(codigo[20:16]),// o rt
.direccion(w_mul2_ban[4:0]),//o aw donde se va a escribir 
.w_r(w_uc_banco),//0 escritura    1 lectura que sale de la uc
.dato(w_mul_ban[31:0]),//el dato que se ecribe
.salida_1(w_salida1[31:0]),
.salida_2(w_salida2[31:0])
);
//concatenador
concatenador ins_concatenador (
.i_con(codigo[15:0]),
.o_con(w_con_mul3[31:0])
); 
//multiplexor 3
multiplexor_11 ins_mul_3(
.i_mul_uc(w_uc_mul3), //salida de la uc y entrada del multiplexor 
.i_uno(w_con_mul3[31:0]),    //entrada en la posicion uno 
.i_cero(w_salida2[31:0]),     //entrada en la pocision 0 
.o_multi(w_mul3_alu[31:0])
);
//alu control 
alu_control_11 ins_alu_control_11(
.i_aluc(w_uc_aluc[2:0]),//entrada de uc
.i_fun(codigo[5:0]),//entrada de la funcion 
.o_aluc(w_aluc_alu[2:0])//lo que va a entrar en la selectora 
);
//alu
alu_11 ins_alu_11(
.bit_1(w_salida1[31:0]),
.bit_2(w_mul3_alu[31:0]),
.switch(w_aluc_alu[2:0]),
.out(w_alu_mem[31:0]),
.ZF(cero)
);
//memoria de datos
memoria_de_datos_11 ins_memoia_de_datos_11(
.i_w(w_uc_menw),
.i_r(w_uc_menr),
.i_memoria(w_alu_mem[31:0]),//dereccion que va a leer o guardar 
.d_memoria(w_salida2[31:0]),//dato que se va a guardar
.o_memoria(w_ban_mul[31:0])
);
//multiplexor 
multiplexor_11 ins_multiplexor_11(
.i_mul_uc(w_uc_mul), //salida de la uc y entrada del multiplexor 
.i_uno(w_alu_mem[31:0]),    //entrada en la posicion uno 
.i_cero(w_ban_mul[31:0]),     //entrada en la pocision 0 
.o_multi(w_mul_ban[31:0])
);
endmodule 