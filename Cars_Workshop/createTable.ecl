/*
Use of table to calculate:
- Avg cost per brand
- Avg cost per brand and model
- How many cars per year is on the market
*/

IMPORT getCars;

carsDS :=getCars.carsDS;

//Create Table record definition
brand_Cost_rec := RECORD
   carsDS.brand;
   avgCost := ROUND(AVE(GROUP, carsDS.price));
END;

brand_Cost_Avg := TABLE(carsDS,
                        brand_Cost_rec,
                        brand);

OUTPUT(brand_Cost_Avg, NAMED('brand_Cost_Avg'));

//*********************************************************
//Avg per brand per model
brand_Model_Rec := RECORD
   carsDS.brand;
	 carsDS.model;
   avgCost := ROUND(AVE(GROUP, carsDS.price));
END;

brand_Model_Avg := TABLE(carsDS,
                        brand_Model_Rec,
                        brand, model);

OUTPUT(brand_Model_Avg, NAMED('brand_Model_Avg'));

//***********************************************************
//How many cars per year is on the market
brand_year_Rec := RECORD
   carsDS.brand;
	 carsDS.year;
   Total := COUNT(GROUP);
END;

brand_Year_Sum := TABLE(carsDS,
                        brand_year_Rec,
                        brand, year);

OUTPUT(brand_Year_Sum, NAMED('brand_Year_Sum'));

//Testing the work

//Filter for specific rows
OUTPUT(carsDS(brand = 'bmw' and year = 2008), NAMED('test_BMW'));

//Check to see if totols are matching
OUTPUT(COUNT(carsDS) = SUM(brand_Year_Sum, total), NAMED('isCount_Matching'));







