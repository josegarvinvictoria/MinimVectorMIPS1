				.data
N = 10
vector:			.word   -23, 23334, 886,-443, -423864, 24403, 48909, -1864, 544398, 235546
				.text
				.globl main
main:			li    $t1, 0			
				li	  $t2, 0			
				li	  $t3, 1				#Apuntador al minim
				li	  $t4, 0				#Contador
				li	  $s0, N						
				lw 	  $t5, vector($t1)		#Llegir el primer valor. En aquest registre sempre hi haura el valor minim
				addi  $t4, $t4, 1			#Increment del contador
carrega:		addi  $t1, $t1, 4			#Canvi de direccio per la cerca del seguent valor
				lw	  $t6, vector($t1)		#Llegir el segon valor
				addi  $t4, $t4, 1			#Increment del contador
				slt	  $t7, $t5, $t6			#Comparacio de valors. Si $t5 < $t6 --> $t7=1
				beq   $t7, $0, inter		#Si $t7 es igual a 0 cal intercanviat el valor mínim
				beq   $t4, $s0, fi			#Si $t4 es igual a 0, s'ha acabat de recorrer el vector, saltem a 'fi'
				bne	  $t7, $t2, carrega		#Si $t7 i $t2 no contenen el mateix cal saltar a l'etiqueta 'carrega'
inter:			move  $t3, $t4			
				move  $t5, $t6
				beq   $t4, $s0, fi
				j carrega					
fi:				j $ra

				
				.end main
