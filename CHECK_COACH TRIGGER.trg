CREATE OR REPLACE TRIGGER CHECK_COACH
BEFORE  INSERT
ON COACH_DETAILS 
FOR EACH ROW
DECLARE 
NUMBER_ROWS NUMBER;
L_COACH COACH % ROWTYPE;
COUNTER    NUMBER;
BEGIN 
    SELECT COUNT(*)
    INTO NUMBER_ROWS
    FROM COACH;  
    COUNTER:= NUMBER_ROWS;
    
    FOR I IN 1..NUMBER_ROWS LOOP
       L_COACH:=  GENERAL_SPORT.COACH_DATA(I);
       
       IF L_COACH.COACH_ID = SUBSTR(:NEW.COACH_CODE, 5)
       THEN 
            COUNTER := COUNTER - 1;
        END IF;
        
       IF COUNTER = I 
       THEN 
                RAISE_APPLICATION_ERROR(-2873,'COUNTER = I  HATA !!');
        END IF;
    END LOOP;
    
END;