/*En el salón de Musimundos tenemos un cliente fanático de Willie Dixon, quiere comprar toda la colección de sus temas, pero NO le interesan los temas que sean de su etapa en el rock.

Hagamos una consulta en la base de datos donde muestre todos los registros que contengan canciones con sus géneros, Y que el compositor sea Willie Dixon, Y que tengan el género Blues.

Ingresá el nombre de la segunda canción que obtuviste.*/

select canciones.nombre, generos.nombre, compositor 
from canciones, generos
where canciones.compositor = "Willie Dixon" and generos.nombre = "Blues";


