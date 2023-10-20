create database Transaccionstruss;
use Transaccionstruss;

-- Crea una tabla para simular una operación de transferencia entre dos cuentas
CREATE TABLE cuentas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  saldo DECIMAL(10,2)
);

-- Inserta algunos datos de prueba en la tabla
INSERT INTO cuentas (nombre, saldo) VALUES ('Cuenta A', 1000.00);
INSERT INTO cuentas (nombre, saldo) VALUES ('Cuenta B', 500.00);

-- Crea el procedimiento almacenado
DELIMITER //
CREATE PROCEDURE transferir(IN desde INT, IN hacia INT, IN cantidad DECIMAL(10,2))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    -- Error al realizar la transacción, un rollback es necesario
    ROLLBACK;
    SELECT 'Error: ', SQLERRM;
  END;

  -- Inicia una transacción
  START TRANSACTION;

  -- Actualiza el saldo de la cuenta desde donde se transferirá
  UPDATE cuentas SET saldo = saldo - cantidad WHERE id = desde;
  -- Actualiza el saldo de la cuenta hacia donde se transferirá
  UPDATE cuentas SET saldo = saldo + cantidad WHERE id = hacia;

  -- Realiza la transferencia completa
  COMMIT;

  -- Muestra el mensaje de éxito
  SELECT 'Transferencia completada exitosamente';

END //
DELIMITER ;

-- Ejecuta el procedimiento almacenado para transferir $200 de la cuenta A a la cuenta B
CALL transferir(1, 2, 200.00);

-- Verifica los saldos después de la transferencia
SELECT * FROM cuentas;