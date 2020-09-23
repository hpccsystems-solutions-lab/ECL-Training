EXPORT getCarsLayout := MODULE
  // Create a layout
  EXPORT cars_layout := RECORD
    INTEGER carID;
    INTEGER price;
    STRING  brand;
    STRING model;
    INTEGER year;
    STRING title_status;
    REAL   mileage;
    STRING color;
    INTEGER vin;
    INTEGER lotNum;
    STRING state;
    STRING country;
    STRING condition;
  END;

	//create dataset
	EXPORT carsDS := DATASET('~usa::cars::csv', 
                           cars_layout, 
                           CSV(HEADING(1)));

END;