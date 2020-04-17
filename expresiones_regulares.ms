*BORRADOR
**Fuente: https://www.enmimaquinafunciona.com/pregunta/112309/borrar-todo-el-texto-antes-y-despues-de-una-determinada-cadena-de

Si asumimos que el SOMEURL y first-category no contienen dígitos, podemos simplemente buscar la primera cadena no vacía de números y eliminar todo lo demás.

Patrón:
Find what:    (.*?)(\d+).*
Replace with: \2
Cómo funciona:

.* es una cadena arbitraria de caracteres

? hace .* perezoso, es decir, coincide con tan pocos caracteres como sea posible

\d+ es una cadena no vacía de dígitos

() grupos de personajes, donde \2 se refiere a la segunda de grupo

Para obtener más información sobre las Expresiones Regulares, haga clic aquí.

Ejemplo:

http://www.SOMEURL.com/first-category/1343381-example-text-text-text-2000-a.html
http://www.SOMEOTHERURL.com/some-category/1343382-example-more-text-2001-b.html
se sustituye con

1343381
