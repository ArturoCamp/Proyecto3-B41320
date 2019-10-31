CREATE DATABASE PROYECTO3
USE PROYECTO3

CREATE TABLE CLIENTS
(
IdClients INT IDENTITY(1,1)NOT NULL,
NamePerson VARCHAR(25),
LastName VARCHAR(50),
DateIns  DATE,
Migra INT
)
CREATE TABLE CARDS
(
IdCards INT IDENTITY(1,1)NOT NULL,
NumberCard VARCHAR (25),
Code VARCHAR(25),
DateIns  DATE,
Migra INT
)
CREATE TABLE PURCHASES
(
IdPurchases INT IDENTITY(1,1),
Product VARCHAR(100),
TotalPurchase int,
DateIns  DATE,
Migra INT
)

CREATE TABLE PHONES
(
IdPhones INT IDENTITY(1,1),
NumberPhone VARCHAR (20),
DateIns  DATE,
Migra INT
)
CREATE TABLE ADDRESS_CLIENT
(
IdAddress INT IDENTITY(1,1),
AddressClient VARCHAR (100),
DateIns  DATE,
Migra INT
)
CREATE TABLE EMAIL
(
IdEmail INT IDENTITY(1,1),
Email VARCHAR(100),
DateIns  DATE,
Migra INT
)

declare
@x int =1,
@y int =250
while @x <= @y
begin
	--PURCHASES
	INSERT INTO PURCHASES(Product,TotalPurchase,DateIns,Migra)VALUES('SWITCH',10000,'2019/10/31',0)
	INSERT INTO PURCHASES(Product,TotalPurchase,DateIns,Migra)VALUES('PLAY 3',25000,'2019/10/31',0)
	INSERT INTO PURCHASES(Product,TotalPurchase,DateIns,Migra)VALUES('CPU',100,'2019/10/31',0)
	INSERT INTO PURCHASES(Product,TotalPurchase,DateIns,Migra)VALUES('ARROZ',4950,'2019/10/31',0)
	--PHONES
	INSERT INTO PHONES(NumberPhone,DateIns,Migra)VALUES('70465825','2019/10/31',0)
	INSERT INTO PHONES(NumberPhone,DateIns,Migra)VALUES('70465824','2019/10/31',0)
	INSERT INTO PHONES(NumberPhone,DateIns,Migra)VALUES('70468823','2019/10/31',0)
	INSERT INTO PHONES(NumberPhone,DateIns,Migra)VALUES('70465822','2019/10/31',0)
	--ADDRESS_CLIENT
	INSERT INTO ADDRESS_CLIENT(AddressClient,DateIns,Migra)VALUES('TURRIALBA','2016/10/31',0)
	INSERT INTO ADDRESS_CLIENT(AddressClient,DateIns,Migra)VALUES('TURRIALBA','2016/10/31',0)
	INSERT INTO ADDRESS_CLIENT(AddressClient,DateIns,Migra)VALUES('TURRIALBA','2016/10/31',0)
	INSERT INTO ADDRESS_CLIENT(AddressClient,DateIns,Migra)VALUES('TURRIALBA','2016/10/31',0)
	--EMAIL
	INSERT INTO EMAIL(Email,DateIns,Migra)VALUES('wxyz@gmail.com','2018/9/15',0)
	INSERT INTO EMAIL(Email,DateIns,Migra)VALUES('wxAB@gmail.com','2018/09/15',0)
	INSERT INTO EMAIL(Email,DateIns,Migra)VALUES('ABCD@hotmail.com','2018/9/15',0)
	INSERT INTO EMAIL(Email,DateIns,Migra)VALUES('xywz@gmail.com','2018/09/15',0)
	CARDS
	INSERT INTO CARDS(NumberCard,Code,DateIns,Migra)VALUES('2222222222222222','535','2019/10/31',0)
	INSERT INTO CARDS(NumberCard,Code,DateIns,Migra)VALUES('3333333333333333','985','2019/10/31',0)
	INSERT INTO CARDS(NumberCard,Code,DateIns,Migra)VALUES('4444444444444444','789','2019/10/31',0)
	INSERT INTO CARDS(NumberCard,Code,DateIns,Migra)VALUES('5555555555555555','789','2019/10/31',0)
	CLIENTS
INSERT INTO CLIENTS(NamePerson,LastName,DateIns,Migra)VALUES('Ariel','Lassitter','2019/10/26',0)
INSERT INTO CLIENTS(NamePerson,LastName,DateIns,Migra)VALUES('Anthony','El capi','2019/10/26',0)
INSERT INTO CLIENTS(NamePerson,LastName,DateIns,Migra)VALUES('Arturo','Vidal','2019/10/26',0)
INSERT INTO CLIENTS(NamePerson,LastName,DateIns,Migra)VALUES('Walter','Centeno','2019/10/26',0)
SET @X=@X+1
end
delete from CARDS
where IdCards>1000
select * from clients
SELECT * FROM CARDS
SELECT * FROM PURCHASES
SELECT * FROM PHONES
SELECT * FROM ADDRESS_CLIENT
SELECT * FROM EMAIL

CREATE PROCEDURE COURSE.spTEST_GetAll 
@OUTPUT_ISSUCCESSFUL INT OUTPUT
,@OUTPUT_STATUS VARCHAR(25) OUTPUT
	AS
BEGIN
	SET NOCOUNT ON;

	SET @OUTPUT_ISSUCCESSFUL = 0
	SET @OUTPUT_STATUS = 'Error returning data'

	BEGIN TRY
		
		--SELECT FROM TABLE TEST
		SELECT TOP 10
			ID
			,PERSONAL_ID
			,[NAME]
			,[PHONE]
			,[ADDRESS]
			,MIGRATED
		INTO TEMP
		FROM COURSE.TEST
		WHERE MIGRATED = 0
		

		UPDATE COURSE.TEST 
		SET MIGRATED = 1
		FROM COURSE.TEST
			JOIN TEMP 
				ON COURSE.TEST.ID = TEMP.ID

			SELECT 
			 t.ID
			,t.PERSONAL_ID
			,t.[NAME]
			,t.[PHONE]
			,t.[ADDRESS]
			,t.MIGRATED
			FROM TEMP T
				JOIN TEMP 
				ON T.ID = TEMP.ID

		DROP TABLE TEMP

		SET @OUTPUT_STATUS = 'Successful running'
		SET @OUTPUT_ISSUCCESSFUL = 1
		
		
	END TRY
	BEGIN CATCH
		
		SET @OUTPUT_STATUS = @OUTPUT_STATUS + ' ' + ERROR_MESSAGE()
		SET @OUTPUT_ISSUCCESSFUL = 1
		RAISERROR(@OUTPUT_STATUS,16,1)

	END CATCH



END
GO

create procedure sp_export @tipo,@fechaIni, @fechaFi
as
begin
	



end
go

create procedure sp_delete
as
begin
	delete from clients, purchases
		where migra=1;
	

end
go