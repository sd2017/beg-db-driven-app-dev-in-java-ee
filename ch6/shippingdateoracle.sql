CREATE OR REPLACE FUNCTION shippingDate RETURN DATE IS
  dayno NUMBER;
  shpdate DATE;
 BEGIN
 SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'D')) INTO dayno FROM DUAL;
 IF (dayno>1) AND (dayno<7) THEN
  SELECT SYSDATE INTO shpdate FROM DUAL;
 ELSE 
  SELECT NEXT_DAY(SYSDATE, 'MONDAY') INTO shpdate FROM DUAL;
 END IF;
 RETURN shpdate;
END;
/