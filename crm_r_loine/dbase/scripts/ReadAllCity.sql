SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ReadAllCity]
(@cit_actual    udd_type)

AS

/*      Read all records        */
   SELECT
      cit_code        = City.cit_code,
      cit_country     = Country.cty_name_first,
      cit_name_first  = City.cit_name_first,
      cit_name_second = City.cit_name_second, 
      cit_phone_code  = City.cit_phone_code,
      cit_actual      = City.cit_actual
   FROM  City,
         Country
   WHERE City.cit_actual    >= @cit_actual
     AND City.cit_deleted    = 0
     AND Country.cty_code    = City.cit_country
     AND Country.cty_actual >= @cit_actual
     AND Country.cty_deleted = 0
   ORDER BY
      City.cit_name_first
