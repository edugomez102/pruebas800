#!/bin/bash
function corrigetodo(){
	javac Juego.java
	for (( i = 5; i <= 807; i++ )); do
		#statements
		java Juego practica3-prueba/p0$i.ent practica3-prueba/p0$i.sal
		printf "$i "
	done
	echo ""
}
while [[ true ]]; do
	#statements
	echo "  Introduce 'todo' para ejecutar todo(Necesario la primera vez, tarda un rato)"
	echo "  Introduce 'diff' para ver todas las diferencias"
	echo "  Introduce 'unica' para elegir numero de diferencia"
	echo "  Escribe cualquier otra cosa para salir"
	read lee
	if [[ "$lee" = "todo" ]]; then
		#statements
		corrigetodo 

	elif [[ "$lee" = "diff" ]]; then
		#statements
		cont=0
		for (( i = 5; i <= 807; i++ )); do
			#statements
			dif=$(diff -w practica3-prueba/p0$i.sal practica3-prueba/p0$i.txt)
			if [[ -n "$dif" ]]; then
				#statements
				echo "  --->$i Hay DIFERENCIA"
				(( COUNTER++ ))
			# else
			# 	echo "No hay diferencias"
			fi
		done
		echo "Numero de diferencias: $COUNTER"
		echo "(Si no pone nada significa que no hay diferencias)"
	elif [[ "$lee" = "unica" ]]; then
		#statements
		while [[ true ]]; do				
		echo "  Introduce numero de diferencia rango [6,306]:"
		echo "  el primer archivo sera el propio y el segundo el de Alicia"
		echo "  tambien se crearan dos archivos .txt en la carpeta donde se encuentran los ficheros fuente de java"
		echo "  se eliminaran automaticamente al cambiar de diferencia"
		echo "  Escribe otra cosa para volver"
		read num
		echo ""
		if [[ "$num" -ge 6 ]] && [[ "$num" -le 306 ]]; then
			#statements
			for (( i = 5; i <= 807; i++ )); do
				#statements
				if [[ i -eq num ]]; then
					#statements
					diff -w -s practica3-prueba/p0$i.sal practica3-prueba/p0$i.txt
					cat practica3-prueba/p0$i.sal > propio$i.txt 
					cat practica3-prueba/p0$i.txt > alicia$i.txt
				fi
			done
			echo "  "
		while [[ true ]]; do		
				#statements
				echo "  Ahora puedes editar tus archivos fuente de java para ver si se corrige la diferencia"
				echo "  Escribe 'java' para volver a compilar,ejecutar y ver la diferencia"
				echo "  Escribe cualquier otra cosa para elegir diferencia"
				read dsps
				if [[ "$dsps" = "java" ]]; then
					#statements
					# echo "  $num"
					javac Juego.java
					java Juego practica3-prueba/p0$num.ent practica3-prueba/p0$num.sal 
					diff -w -s practica3-prueba/p0$num.sal practica3-prueba/p0$num.txt
					cat practica3-prueba/p0$num.sal > propio$num.txt 
					cat practica3-prueba/p0$num.txt > alicia$num.txt
					echo ""
				else
					rm propio$num.txt && rm alicia$num.txt
					break
				fi
			done
		else
			break
		fi	
		done
	else
		exit
	fi

done


