--cleaning column [X ID], Deleting NULL values in [X ID] if exists
DELETE FROM marketing_campaign
WHERE [X ID] IS NULL

-- cleaning column [X ID] and [Response] by removing ( " )
UPDATE marketing_campaign
SET [X ID] = REPLACE([X ID], '"', ''),
    Response = REPLACE(Response, '"', '')

--Formatting the [Dt_Customer] column to the same date formate and type
update marketing_campaign
set Dt_Customer= FORMAT(CONVERT(datetime,Dt_customer, 103), 'MM/dd/yyyy')

--Changing [Income] column type to integer
ALTER TABLE marketing_campaign ALTER COLUMN Income INT

--A 'NA' Values was found in [Income], Setting the 'NA' Value to NULL
UPDATE marketing_campaign
SET Income = NULL
WHERE Income = 'NA'

select * from marketing_campaign -- ALL IS GOOD SO FAR 

--Trying to set column [Income] to integer type again
ALTER TABLE marketing_campaign ALTER COLUMN Income INT --All is good

--Setting Year_Birth column to date type and changing its format
UPDATE marketing_campaign
SET Year_Birth = format(convert(datetime,year_birth),'yyyy')

--Changing the type for all columns
--Keeping [X ID] as a Varchar
ALTER TABLE marketing_campaign ALTER COLUMN Year_Birth Date
--Keeping [Education] as a Varchar
--Keeping [Marital_status] as a Varchar
ALTER TABLE marketing_campaign ALTER COLUMN Income INT
ALTER TABLE marketing_campaign ALTER COLUMN Kidhome INT
ALTER TABLE marketing_campaign ALTER COLUMN Teenhome INT
ALTER TABLE marketing_campaign ALTER COLUMN Dt_Customer Date
ALTER TABLE marketing_campaign ALTER COLUMN Recency INT
ALTER TABLE marketing_campaign ALTER COLUMN MntWines INT
ALTER TABLE marketing_campaign ALTER COLUMN MntFruits INT
ALTER TABLE marketing_campaign ALTER COLUMN MntMeatProducts INT
ALTER TABLE marketing_campaign ALTER COLUMN MntFishProducts INT
ALTER TABLE marketing_campaign ALTER COLUMN MntSweetProducts INT
ALTER TABLE marketing_campaign ALTER COLUMN MntGoldProds INT
ALTER TABLE marketing_campaign ALTER COLUMN NumDealsPurchases INT
ALTER TABLE marketing_campaign ALTER COLUMN NumWebPurchases INT
ALTER TABLE marketing_campaign ALTER COLUMN NumCatalogPurchases INT
ALTER TABLE marketing_campaign ALTER COLUMN NumStorePurchases INT
ALTER TABLE marketing_campaign ALTER COLUMN NumWebVisitsMonth INT
ALTER TABLE marketing_campaign ALTER COLUMN AcceptedCmp3 VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN AcceptedCmp4 VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN AcceptedCmp5 VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN AcceptedCmp1 VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN AcceptedCmp2 VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN Complain VARCHAR(10)
ALTER TABLE marketing_campaign ALTER COLUMN Z_CostContact INT
ALTER TABLE marketing_campaign ALTER COLUMN Z_Revenue INT
ALTER TABLE marketing_campaign ALTER COLUMN Response VARCHAR(10)

/*Checking the data types
Object Explorer >>dbo.marketing_campaign>> Design .....All is good so far*/


UPDATE marketing_campaign
SET Age = DATEDIFF(year, Year_Birth, GETDATE())

--Replacing 0 and 1 in campaigns columns with YES and NO
UPDATE marketing_campaign
SET AcceptedCmp1 = REPLACE(AcceptedCmp1,1,'YES'),
	AcceptedCmp2 = REPLACE(AcceptedCmp2,1,'YES'),
	AcceptedCmp3 = REPLACE(AcceptedCmp3,1,'YES'),
	AcceptedCmp4 = REPLACE(AcceptedCmp4,1,'YES'),
	AcceptedCmp5 = REPLACE(AcceptedCmp5,1,'YES'),
	Complain = REPLACE(Complain,1,'YES'),
	Response = REPLACE(Response,1,'YES')

UPDATE marketing_campaign
SET AcceptedCmp1 = REPLACE(AcceptedCmp1,0,'NO'),
    AcceptedCmp2 = REPLACE(AcceptedCmp2,0,'NO'),
    AcceptedCmp3 = REPLACE(AcceptedCmp3,0,'NO'),
    AcceptedCmp4 = REPLACE(AcceptedCmp4,0,'NO'),
    AcceptedCmp5 = REPLACE(AcceptedCmp5,0,'NO'),
	Complain = REPLACE(Complain,0,'NO'),
    Response = REPLACE(Response,0,'NO')

--Adding New Column Age, Calculated from the Year_Birth
ALTER TABLE marketing_campaign
ADD Age INT

