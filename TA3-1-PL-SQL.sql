DECLARE
V_WEIGHT      NUMBER(3)       :=  600;
V_MESSAGE     VARCHAR2(255)   :=  'PRODUCT 10012';

BEGIN
  DECLARE

  V_WEIGHT      NUMBER(3)       :=  1;
  V_MESSAGE     VARCHAR2(255)   :=  'PRODUCT 11001';
  V_NEW_LOCN    VARCHAR2(50)    :=  'EUROPE';

  BEGIN
  V_WEIGHT      := V_WEIGHT + 1;
  V_NEW_LOCN    :=  'EUROPE' || V_NEW_LOCN;
  END;

V_WEIGHT      := V_WEIGHT + 1;
V_MESSAGE := V_MESSAGE || ' IS IN STOCK';
V_NEW_LOCN := 'WESTERN' || V_NEW_LOCN;

END;  
