-- Statement selects the Session ID with its related course ID with descriptions.
SELECT
`session`.`Session_ID`,
`session`.`Description`,
`session`.`Course_ID`,
`course`.`Course_Name`
FROM `tutoring`.`session`,`tutoring`.`course`
WHERE `session`.`Course_ID` = 2 AND `session`.`Course_ID` = `course`.`Course_ID`;

-- Statement that gives a Session Instance date and time.
SELECT
`session_instance`.`Instance_ID`,
`session_instance`.`Instance_Date`,
`session_instance`.`Instance_Time`,
`session_instance`.`Session_ID`
FROM `tutoring`.`session_instance`
WHERE `session_instance`.`Instance_Date` = '2014-04-15';

-- Statement that returns Tutee Information based on the username.
SELECT
`tutee`.`Student_ID`,
`tutee`.`First_Name`,
`tutee`.`Last_Name`,
`tutee`.`Email_ID`,
`tutee`.`Class_Year`,
`tutee`.`Tutee_Username`,
`tutee`.`Major_ID`,
`tutee`.`Second_Major_ID`
FROM `tutoring`.`tutee`
WHERE `tutee`.`Tutee_Username` = 'temnymd';

-- Statement that returns tutor information based on username.
SELECT
`tutor`.`Tutor_Username`,
`tutor`.`Tutor_First_Name`,
`tutor`.`Tutor_Last_Name`,
`tutor`.`Tutor_Email_ID`,
`tutor`.`Student_ID`
FROM `tutoring`.`tutor`
WHERE `tutor`.`Tutor_Username` = 'placeza';

