
// Create a layout
cars_layout := RECORD
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

//create dataset: file is a csv format
carsDS := DATASET('~usa::cars::csv', cars_layout, CSV(HEADING(1)));

//If your record layout is too big
/*filepath := '~thor::spotify::music::top::2000::thor';
fileDs := DATASET(filepath, RECORDOF(filepath, LOOKUP), THOR, OPT);
OUTPUT(fileDs);
*/

//choose the first 100 rows
OUTPUT(CHOOSEN(carsds, 100));

//fiter for 2008 cars
filterme := carsDS(year = 2008);
//filterme;

//Sort by brand
sortme := SORT(filterme, brand);
//sortme;

//Filter out all 2008 cars and then sort by brand
cars := SORT(carsds(year != 2008), brand);

//get max mileage
maxMe := MAX(carsDS, mileage);

//filter dataset to just see the ,max mileage
carsds(mileage = maxMe);               

             
 
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             