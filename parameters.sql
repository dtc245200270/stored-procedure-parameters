







































USE classicmodels;

-- 1. Tham so loai IN
DELIMITER //
DROP PROCEDURE IF EXISTS getCusById //
CREATE PROCEDURE getCusById(IN cusNum INT(11))
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //
DELIMITER ;

CALL getCusById(175);

-- 2. Tham so loai OUT
DELIMITER //
DROP PROCEDURE IF EXISTS GetCustomersCountByCity //
CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //
DELIMITER ;

CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total;

-- 3. Tham so loai INOUT
DELIMITER //
DROP PROCEDURE IF EXISTS SetCounter //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 5);
SELECT @counter;
