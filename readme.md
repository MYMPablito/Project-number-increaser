## ¡Bienvenido/a! Explicación:

##### Creación de un Incrementador de números con PowerCOBOL 3.10 usando el lenguaje de programación COBOL.

## Lenguajes y tecnologías.

<div>
<img src="./imgs/logo-cobol.png" alt="logo-cobol" width="40" height="40" />
</div>
<div>

</div>

Le vamos a añadir al campo *"Edit"* el evento *"RETURN"* para crear un campo numérico que se vaya incrementando de 100 en 100 cada vez que se active con la tecla *ENTER*. Además, que cuando llegue a 1000, que borre el incremento y que vuelva a empezar. No solo eso, le añadiremos al botón el evento *"CLICK"* para que sea capaz de hacer lo mismo pulsándolo con el clic. 


Empezamos con el código que hará que se incremente el contador al pulsar la tecla ENTER. Para que funcione, hay que tener activada la opción Event > [Enter] Key.

Editamos el evento "RETURN" del campo de texto.

```
ENVIRONMENT DIVISION.
 DATA DIVISION.
 WORKING-STORAGE SECTION.
 77 Contador PIC 9(4) VALUE ZEROS.
 77 Incremento PIC 9(4) VALUE ZEROS.

 PROCEDURE DIVISION.
 IncrementaContador.
*Se asigna el valor del CAMPO-TEXTO a la variable Contador.
 MOVE POW-TEXT OF CAMPO-TEXTO TO Contador.

*Se realiza el incremento.
 ADD 100 TO Incremento.

*Se cambia el valor anterior de CAMPO-TEXTO.
 MOVE Incremento TO POW-TEXT OF CAMPO-TEXTO.
```

Contamos con dos variables. *Contador* sirve para almacenar el valor inicial del *CAMPO-TEXTO*. Este valor lo obtenemos con un una instrucción de PowerCOBOL, *POW-TEXT*, es ahí donde se guarda el valor de texto del campo de texto.

Primero, asignamos el valor del campo de texto a la variable *Contador*. 

Lo siguiente, es el incremento, el cual es de 100 en 100.

Puesto que las variables llevan un PICTURE de 4, el contador solo podrá llegar a 9900. Después pasará a 0 de nuevo.

Finalmente, el valor de ese incremento, es asignado con *POW-TEXT* la suma de 100.

Necesitamos dos variables, para que cuando se haga la asignación, no se borre el valor anterior, lo que nos dejaría un contador que se incrementaría una sola vez a 100.


Ahora, copio y pego todo el código del evento en el evento click del botón. Al dejar los dos eventos, los valores del incremento con el botón, van a ser diferentes de los de la tecla "ENTER". Son dos archivos de COBOL distintos.

Para terminar, lo que quiero es que el incremento solo sea capaz de llegar a 1000. Luego, que quede a 0. Para ello, haremos uso de un condicional IF.

Lo que hace este IF, es que cuando el valor de Incremento está en 1000, que se asignen ZEROS al POW-TEXT de CAMPO-TEXTO y a la variable de Incremento. De esta forma restablecemos lo que se ve en la pantalla y el valor del incremento.

```
 *Limitacion del contador en 1000.
 IF Incremento > 1000
 MOVE ZEROS TO POW-TEXT OF CAMPO-TEXTO
 MOVE ZEROS TO Incremento
 END-IF.
```


-----------------------------------------------
-----------------------------------------------
-----------------------------------------------


## Welcome! Explanation:

##### Creation of a number incrementer with PowerCOBOL 3.10 using the COBOL programming language.

## Languages and technologies:

<div>
<img src="./imgs/logo-cobol.png" alt="logo-cobol" width="40" height="40" />
</div>
<div>

</div>

We are going to add to the field *"Edit "* the event *"RETURN "* to create a numeric field that will increment from 100 to 100 each time it is activated with the *ENTER* key. In addition, when it reaches 1000, to erase the increment and to begin again. Not only that, we will add to the button the event *"CLICK "* so that it will be able to do the same thing pressing it with the click. 

```
ENVIRONMENT DIVISION.
 DATA DIVISION.
 WORKING-STORAGE SECTION.
 77 Contador PIC 9(4) VALUE ZEROS.
 77 Incremento PIC 9(4) VALUE ZEROS.

 PROCEDURE DIVISION.
 IncrementaContador.
*Se asigna el valor del CAMPO-TEXTO a la variable Contador.
 MOVE POW-TEXT OF CAMPO-TEXTO TO Contador.

*Se realiza el incremento.
 ADD 100 TO Incremento.

*Se cambia el valor anterior de CAMPO-TEXTO.
 MOVE Incremento TO POW-TEXT OF CAMPO-TEXTO.
```

We have two variables. *Counter* is used to store the initial value of the *POW-TEXT*. This value is obtained with a PowerCOBOL instruction, *POW-TEXT*, where the text value of the text field is stored.

First, we assign the value of the text field to the variable *Counter*. 

Next, is the increment, which is 100 by 100.

Since the variables have a PICTURE of 4, the counter can only go to 9900. Then it will go to 0 again.

Finally, the value of this increment is assigned with *POW-TEXT* the sum of 100.

We need two variables, so that when the assignment is made, the previous value is not erased, which would leave us a counter that would increment only once to 100.


Now, I copy and paste all the code of the event in the event click of the button. When leaving the two events, the values of the increment with the button, are going to be different from those of the "ENTER" key. They are two different COBOL files.

To finish, what I want is that the increment is only able to reach 1000. Then, that it remains at 0. For it, we will make use of a conditional IF.

What this IF does, is that when the value of Increment is in 1000, that ZEROS are assigned to the POW-TEXT of FIELD-TEXT and to the variable of Increment. In this way we restore what is seen on the screen and the value of the increment.

```
 *Limitacion del contador en 1000.
 IF Incremento > 1000
 MOVE ZEROS TO POW-TEXT OF CAMPO-TEXTO
 MOVE ZEROS TO Incremento
 END-IF.
```






### ¡Muchas gracias por ver mi proyecto! Dejo enlaces para que puedas contactarme:

### Thank you very much for seeing my project! I leave links so you can contact me:

<div>
<a href="https://www.linkedin.com/in/pablo-mat%C3%ADas-fern%C3%A1ndez-maza-32a20a15b/" target="_blank"><img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linkedin/linkedin-original.svg" alt="java" width="40" height="40"/></a>
<a href="pablo-mato@hotmail.com" target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/7/7e/Gmail_icon_%282020%29.svg" alt="mail" width="40" height="40"/></a>
</div>