# TransaccionesStruss

En este ejemplo, creamos una tabla llamada "cuentas" para simular dos cuentas bancarias. Luego, creamos un procedimiento almacenado llamado "transferir" que toma los ID de las dos cuentas involucradas y la cantidad a transferir como parámetros.

Dentro del procedimiento, utilizamos la cláusula "DECLARE EXIT HANDLER FOR SQLEXCEPTION" para manejar cualquier excepción que pueda ocurrir durante la ejecución de la transacción.
Luego, iniciamos una transacción utilizando "START TRANSACTION" y actualizamos los saldos de las cuentas correspondientes utilizando instrucciones "UPDATE". Después de eso, realizamos un COMMIT para completar la transacción.

Si se produce una excepción durante la transacción, se ejecutará el bloque de código dentro del manejador de excepciones. En este caso, realizamos un ROLLBACK para deshacer cualquier cambio realizado durante la transacción y mostramos un mensaje de error.

Finalmente, mostramos un mensaje de éxito si la transferencia se completa correctamente y seleccionamos los saldos actualizados de las cuentas.
Puedes ejecutar el procedimiento almacenado utilizando la instrucción CALL y verificar los cambios en la tabla "cuentas" antes y después de la transferencia.
