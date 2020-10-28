# In Class Practice

For today's session, we are going to cover Join, DEDUP.\
You will also need to use:\
`STD.Str.ToUpperCase(inputString)`

Please copy paste following inline datasets to your ecl script.

```
studentRec := RECORD
  INTEGER studentID;
	STRING  name;
	STRING  zipCode;
  INTEGER age;
  STRING  major;
  BOOLEAN isGraduated;
END;

studentDS := DATASET([{100, 'Zoro',  30330, 26, 'History', TRUE}, {409, 'Dan', 40001, 26, 'Nursing', FALSE},
                     {300, 'Sarah', 30000, 25, 'Art', FALSE}, {800, 'Sandy', 30339, 20, 'Math', TRUE},
                     {202, 'Alan', 40001, 33, 'Math', TRUE}, {604, 'Danny', 40001, 18, 'N/A', FALSE},
                     {305, 'Liz',  30330, 22, 'Chem', TRUE}, {400, 'Matt', 30005, 22, 'nursing', TRUE}],
                    studentRec);

majorRec := RECORD
  STRING  majorID;
	STRING  majorName;
	INTEGER numOfYears;
  STRING  department;
END;

majorDS := DATASET([{'M101', 'Dentist', 5, 'medical'}, {'M102', 'Nursing', 4, 'Medical'}, {'M201', 'Surgeon', 12, 'Medical'},                   {'S101', 'Math', 4, 'Science'}, {'S333', 'Computer', 4, 'Science'}, {'A101', 'Art', 3, 'Art'},
                    {'A102', 'Digital Art', 3, 'Art'}],
                   majorRec);

addressRec := RECORD
  STRING city;
  STRING2 state;
  STRING5 zipCode;
END;

addrDS := DATASET([{'Atlanta', 'GA', '30330'}, {'atlanta', 'GA', '30331'}, {'Newyork', 'NY', '40001'},
                   {'Los A', 'CA', '50001'}, {'Dallas', 'Texas', '30000'}, {'Boston', 'MA', '60067'},
                   {'Tampa', 'FL', '30044'}, {'smyrna', 'GA', '30330'}],
                  addressRec);

OUTPUT(studentDS, NAMED('studentDS'));
OUTPUT(majorDS, NAMED('majorDS'));
OUTPUT(addrDS, NAMED('addrDS'));

```

**Practice #1**

1- Display all students that have a major defined in majorDS\
2- Test your result

```
getMajorRec := RECORD
  STRING name;
  STRING major;
	STRING yearsTotal;
  STRING department;
END;
```

**Practice #2**

1 - Using getMajorRec, Display all students that DON'T have a major defined in majorDS\
2 - Test your result

**Practice #3**

1 - Display all graduated students and show if they have a city available\
2 - Test your result

```
livingRec := RECORD
  STRING studentName;
  STRING city;
	STRING state;
  STRING zip;
END;
```

**Practice #3**

1- Display all students with all fields in studentDS with the major department and their state, and city\
2 - Test your result

```
allStudentRec := RECORD
  studentRec;
  STRING department;
	STRING city;
	STRING state;
END;
```
