CREATE TABLE SPORT 
(
    SPORT_ID     NUMBER,
    SPORT_NAME   VARCHAR2(100),
    IF_INVALID   VARCHAR2(50),
    CONSTRAINT PK_SPORT_ID PRIMARY KEY (SPORT_ID),
    CONSTRAINT CH_VALID_SPORT CHECK (IF_INVALID = 'VALID' OR IF_INVALID = 'INVALID')
);
