

Create Database INFS3400;

Create Table INFS3400.Students
(
SID Char(10) Primary,
SName Varchar(200) Not Null,
SPhone Char (20) Not Null
);

Create Table INFS3400.Dependents
(
  ID Char(10) Primary Key,
	DID Char(14) Not Null,
	DName Varchar(255) Not Null,
	SID2 Char(10) Not Null,
	Foreign Key (SID2) References INFS3400.Students(SID)
);

Insert Into INFS3400.Students
(SID, SName, SPhone)
Values 
("S123456788", "James Ma", "888-8888"),
("S123456787", "James Marks", "666-8888"),
("S123456786", "Jason Ma", "888-8888")
;

Insert Into INFS3400.Dependents
(ID, DID, DName, SID2)
Values 
(
	"ABC", "D123456789", "TT Ma", "S123456789"
);

Delete From INFS3400.Students 
Where SName = "Jason Ma";

Update INFS3400.Students
Set SPhone = "666-6666"
Where SName = "James Ma";

Select *
From INFS3400.Students
Where SName = "James Ma"
;

