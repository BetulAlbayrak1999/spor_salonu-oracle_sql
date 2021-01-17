CREATE OR REPLACE TRIGGER CHECK_CUSTOMER_SPORT
BEFORE  INSERT
ON CUSTOMER_SPORT_DETAILS
FOR EACH ROW
DECLARE 
NUMBER_ROWS NUMBER;
L_CUSTOMER_SPORT CUSTOMER_SPORT % ROWTYPE;
COUNTER    NUMBER;
BEGIN 
 
    SELECT COUNT(*)
    INTO NUMBER_ROWS
    FROM USER_TABLES
    WHERE TABLE_NAME ='CUSTOMER_SPORT';  
    
    COUNTER:= NUMBER_ROWS;
    
    FOR I IN 1..NUMBER_ROWS LOOP
       L_CUSTOMER_SPORT:=  GENERAL_SPORT.CUSTOMER_SPORT_DATA(I);
       
       IF L_CUSTOMER_SPORT.CUSTOMER_SPORT_ID = SUBSTR(:NEW.CUSTOMER_SPORT_CODE, 5)
       THEN 
            COUNTER := COUNTER - 1;
        END IF;
        
       IF COUNTER = I 
       THEN 
                RAISE_APPLICATION_ERROR(-2899,'COUNTER = I  HATA !!');
        END IF;
    END LOOP;
    
END;