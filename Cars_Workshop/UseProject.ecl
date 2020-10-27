IMPORT getCars;

//Group By Color
getColors := TABLE(getCars.carsDS,
                   {
                   color,
                   total := COUNT(GROUP)
                   },
                   color);

//Viewing table result
OUTPUT(SORT(getColors, -total), NAMED('getColors'));   

//Data Validation:Output invalid colors
OUTPUT(getCars.carsDS(color = 'color:' OR color = 'no_color'), NAMED('invalidColor'));


//Set dark colors
darkColors := ['gray', 'black', 'charcoal',
               'brown', 'shadow black', 'super black',
               'super black', 'tuxedo black metallic', 'dark blue'];

//Set invalid colors
invalidColors := ['color:', 'no_color'];

carsRec := RECORD
  STRING  name;
  STRING  state;
	BOOLEAN Old_Exp;
	STRING  colorType;
END;

carsRec xForm (getCars.cars_layout Le) := TRANSFORM
  SELF.name := Le.brand + ' ' + Le.model;
	SELF.Old_Exp := Le.price >= 10000 AND Le.year <= 2012;
  SELF.colorType := IF(Le.color IN invalidColors, 'Invalid Entry', 
                       			IF(Le.color IN darkColors, 'Dark', 'Light'));
  SELF := Le;
END;

carsRes := PROJECT(getCars.carsDS,
                   xForm(LEFT));

carsRes;