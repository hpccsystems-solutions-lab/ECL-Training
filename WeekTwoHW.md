For this week homework studenta are supposed to:

1- Create a module that calls a function
2- Function will use transfrom and project to perform data transformation.
3- Tranfrom should use data aggreation interduced in week one if possible
3- Module will call the function to print out the result.

Class with start with going over homeworks, so please comein prepared.

A quick look at solution:

EXPORT myMod := MODULE

    // Create your dataset

    SHARED myFunc(mydataset) := FUNCTION
        //Create Tranfrom your choice of inline or standalone
        //Project to go over mydataset

        RETURN myres;
    END;

   // Call your functon and pass the dataset.
   // Don't forget to export

END;

//Call your function and print the result