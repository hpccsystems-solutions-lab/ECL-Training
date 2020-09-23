IMPORT getCarsLayout;

isPricey(
            DATASET(getCarsLayout.cars_layout) cars
                ) 
                 := FUNCTION
 
   isExpRec := RECORD
     INTEGER carID;
     STRING  brand;
     STRING  state;
		 BOOLEAN isExp;
         BOOLEAN exp;
         STRING  def;
	END;

	isExpRec xForm(getCarsLayout.carsDS Li) := TRANSFORM
    SELF.isExp := IF(Li.price >= 25000, TRUE, FALSE);
    SELF := Li;
    SELF := [];
    END;

	isExp := PROJECT(getCarsLayout.CarsDS, 
                  xForm(LEFT));
    
  
  RETURN isExp;
  
END;

OUTPUT(isPricey(getCarsLayout.carsDS));

