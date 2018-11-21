
# Unidade Logica e Aritmetica ULA

Este projeto contém um programa feito em **VHDL** capaz de realizar operações lógicas e aritméticas com números binários de 4 bits, e mostrar o resultado da operação em 4 bases diferentes (decimal, hexadecimal, octal e binario) nos displays de 7 Segmentos.

As operações são:
- Zera Tudo   (Zera o display)
- Tudo 1	    (Mostra 1111 no display)
- Tudo A 	    (Mostra o valor de A no display)
- Tudo B 	    (Mostra o valor de B no display)
- A or B 	    (Operação **or** bit a bit de A com B)
- A and B 	  (Operação **and** bit a bit de A com B)
- A xor B 	  (Operação **xor** bit a bit de A com B)
- not A 	    (Operação **not** bit a bit de A)
- A + B 	    (Mostra o valor da **soma** de A com B)
- A - B 	    (Mostra o valor da **subtração** de A com B)
- A * B 	    (Mostra o valor da **multiplicação** de A com B)
- A / B 	    (Mostra o valor da **divisão** de A com B)
- A mod B 	  (Mostra o **resto da divisão** de A por B)
- sqa A 	    (Mostra o valor de A **elevado ao quadrado**)
- -A 		      (Mostra o **complemento de 2** de A)
- A + 1		    (Mostra o **complemento de 1** de A)

## Vivado

Esse projeto foi feito no Vivado Design Suite, produzido e distribuido pela Xilinx

## Basys3

O projeto foi desenvolvido para uso na Basys 3 Artix-7 FPGA. Deste nodo o xdc do projeto somente é compatível com esse modelo, caso deseje reutilizar o código é necessário configurar os nomes das variáveis do XDC de acordo com a FPGA que deseje utilizar

## Opnião sobre o projeto

O aprendizado sobre linguagens de descrição de hardware e o desenvolvimento de uma simples ULA me fez passar muito raiva com bugs e erros inesplicáveis e indecifráveis que envolvem conexão com hardware.
