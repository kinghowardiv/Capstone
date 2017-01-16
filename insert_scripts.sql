#-----------------------------#
#-----Course Insert-----------#
#-----------------------------#

INSERT INTO `tutoring`.`course`
(`Course_ID`,
`Course_Name`)
VALUES
(1, 'CSC-175-01');

INSERT INTO `tutoring`.`course`
(`Course_ID`,
`Course_Name`)
VALUES
(2, 'BIO-210-03');

INSERT INTO `tutoring`.`course`
(`Course_ID`,
`Course_Name`)
VALUES
(3,'MUS-101-02');

INSERT INTO `tutoring`.`course`
(`Course_ID`,
`Course_Name`)
VALUES
(4,'SPN-410-03');

#------------------------------------#
#-----Administrator Insert-----------#
#------------------------------------#

INSERT INTO `tutoring`.`administrator`
(`Admin_Username`,
`Admin_Rights`)
VALUES
('grimespm', 'level 2');

INSERT INTO `tutoring`.`administrator`
(`Admin_Username`,
`Admin_Rights`)
VALUES
('petersha', 'level 2');

INSERT INTO `tutoring`.`administrator`
(`Admin_Username`,
`Admin_Rights`)
VALUES
('albertoar', 'level 1');

INSERT INTO `tutoring`.`administrator`
(`Admin_Username`,
`Admin_Rights`)
VALUES
('hayesta', 'level 1');

#----------------------------#
#-----Major Insert-----------#
#----------------------------#

INSERT INTO `tutoring`.`major`
(`Major_ID`,
`Major_Name`)
VALUES
(1,'Biology');

INSERT INTO `tutoring`.`major`
(`Major_ID`,
`Major_Name`)
VALUES
(2, 'Computer Science');

INSERT INTO `tutoring`.`major`
(`Major_ID`,
`Major_Name`)
VALUES
(3, 'Spanish');

INSERT INTO `tutoring`.`major`
(`Major_ID`,
`Major_Name`)
VALUES
(4, 'History');

#----------------------------#
#-----Tutee Insert-----------#
#----------------------------#

INSERT INTO `tutoring`.`tutee`
(`Student_ID`,
`First_Name`,
`Last_Name`,
`Email_ID`,
`Class_Year`,
`Tutee_Username`,
`Major_ID`,
`Second_Major_ID`)
VALUES
(1, 'Robert','McCall', 'mccallrp@lemoyne.edu', 2015,
'mccallrp', 3, null);

INSERT INTO `tutoring`.`tutee`
(`Student_ID`,
`First_Name`,
`Last_Name`,
`Email_ID`,
`Class_Year`,
`Tutee_Username`,
`Major_ID`,
`Second_Major_ID`)
VALUES
(2, 'Mark', 'Temnycky', 'temnymd@lemoyne.edu', 2015,
'temnymd', 2, 4);

INSERT INTO `tutoring`.`tutee`
(`Student_ID`,
`First_Name`,
`Last_Name`,
`Email_ID`,
`Class_Year`,
`Tutee_Username`,
`Major_ID`,
`Second_Major_ID`)
VALUES
(3, 'Matt', 'Stallon', 'stallonmt@lemoyne.edu', 2017,
'stallonmt', 1, null);

INSERT INTO `tutoring`.`tutee`
(`Student_ID`,
`First_Name`,
`Last_Name`,
`Email_ID`,
`Class_Year`,
`Tutee_Username`,
`Major_ID`,
`Second_Major_ID`)
VALUES
(4, 'Jacqueline', 'Atkins', 'atkinsjr@lemoyne.edu', 2016,
'atkinsjr', 1, 2);

#---------------------------------#
#-----Instructor Insert-----------#
#---------------------------------#

INSERT INTO `tutoring`.`instructor`
(`Instructor_ID`,
`Instructor_Name`,
`Instructor_Email_Address`)
VALUES
(1, 'David Voorhees', 'voorhedp@lemoyne.edu');

INSERT INTO `tutoring`.`instructor`
(`Instructor_ID`,
`Instructor_Name`,
`Instructor_Email_Address`)
VALUES
(2, 'Charlie Day', 'daycd@lemoyne.edu');

INSERT INTO `tutoring`.`instructor`
(`Instructor_ID`,
`Instructor_Name`,
`Instructor_Email_Address`)
VALUES
(3, 'Eric Andre', 'andrear@lemoyne.edu');

INSERT INTO `tutoring`.`instructor`
(`Instructor_ID`,
`Instructor_Name`,
`Instructor_Email_Address`)
VALUES
(4, 'Hannibal Burress', 'burresshe@lemoyne.edu');

#----------------------------#
#-----Tutor Insert-----------#
#----------------------------#
INSERT INTO `tutoring`.`tutor`
(`Tutor_Username`,
`Tutor_First_Name`,
`Tutor_Last_Name`,
`Tutor_Email_ID`,
`Student_ID`)
VALUES
('ferrincm', 'Conor', 'Ferrin', 'ferrincm@lemoyne.edu', 1);

INSERT INTO `tutoring`.`tutor`
(`Tutor_Username`,
`Tutor_First_Name`,
`Tutor_Last_Name`,
`Tutor_Email_ID`,
`Student_ID`)
VALUES
('davisrl', 'Ryan', 'Davis', 'davisrl@lemoyne.edu',2);

INSERT INTO `tutoring`.`tutor`
(`Tutor_Username`,
`Tutor_First_Name`,
`Tutor_Last_Name`,
`Tutor_Email_ID`,
`Student_ID`)
VALUES
('placeza', 'Zachary', 'Place', 'placeza@lemoyne.edu', 3);

INSERT INTO `tutoring`.`tutor`
(`Tutor_Username`,
`Tutor_First_Name`,
`Tutor_Last_Name`,
`Tutor_Email_ID`,
`Student_ID`)
VALUES
('nagelsme', 'Max', 'Nagelsmith', 'nagelsme@lemoyne.edu', 4);

#------------------------------#
#-----Session Insert-----------#
#------------------------------#

INSERT INTO `tutoring`.`session`
(`Session_ID`,
`Description`,
`Instructor_ID`,
`Course_ID`,
`Tutor_Username`)
VALUES
(1, 'Study session for freshmen students to assits learning the basics of computing.',
1, 1, 'ferrincm');


INSERT INTO `tutoring`.`session`
(`Session_ID`,
`Description`,
`Instructor_ID`,
`Course_ID`,
`Tutor_Username`)
VALUES
(2, 'Session for spanish students to assit in learning written spanish skills.',
3, 4, 'davisrl');

INSERT INTO `tutoring`.`session`
(`Session_ID`,
`Description`,
`Instructor_ID`,
`Course_ID`,
`Tutor_Username`)
VALUES
(3, 'Session for students that need asstaince on their music research papers.',
2, 3, 'placeza');

INSERT INTO `tutoring`.`session`
(`Session_ID`,
`Description`,
`Instructor_ID`,
`Course_ID`,
`Tutor_Username`)
VALUES
(4, 'Session for biology students who need assitance on biology labs.',
4, 2, 'nagelsme');

#---------------------------------------#
#-----Session Instance Insert-----------#
#---------------------------------------#

INSERT INTO `tutoring`.`session_instance`
(`Instance_ID`,
`Instance_Date`,
`Instance_Time`,
`Number_of_Returning`,
`Number_of_New`,
`Session_ID`)
VALUES
(1, '2014-04-15', '18:30:00', 3, 1, 1);

INSERT INTO `tutoring`.`session_instance`
(`Instance_ID`,
`Instance_Date`,
`Instance_Time`,
`Number_of_Returning`,
`Number_of_New`,
`Session_ID`)
VALUES
(2, '2014-04-17', '18:30:00', 4, 0, 2);

INSERT INTO `tutoring`.`session_instance`
(`Instance_ID`,
`Instance_Date`,
`Instance_Time`,
`Number_of_Returning`,
`Number_of_New`,
`Session_ID`)
VALUES
(3, '2013-02-22', '16:00:00', 2, 0, 3);

INSERT INTO `tutoring`.`session_instance`
(`Instance_ID`,
`Instance_Date`,
`Instance_Time`,
`Number_of_Returning`,
`Number_of_New`,
`Session_ID`)
VALUES
(4, '2014-11-24', '19:00:00', 0, 1, 4);

#--------------------------------#
#-----Attendants Insert----------#
#--------------------------------#
INSERT INTO `tutoring`.`attendants`
(`Instance_ID`,
`Tutee_Username`)
VALUES
(4, 'temnymd');

INSERT INTO `tutoring`.`attendants`
(`Instance_ID`,
`Tutee_Username`)
VALUES
(1, 'stallonmt');

INSERT INTO `tutoring`.`attendants`
(`Instance_ID`,
`Tutee_Username`)
VALUES
(2, 'mccallrp');

INSERT INTO `tutoring`.`attendants`
(`Instance_ID`,
`Tutee_Username`)
VALUES
(3, 'atkinsjr');
