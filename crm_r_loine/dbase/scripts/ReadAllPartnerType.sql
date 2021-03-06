USE [VL]
GO
/****** Объект:  StoredProcedure [dbo].[ReadAllPartnerType]    Дата сценария: 04/26/2013 10:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Definition for stored procedure ReadAllPartnerType : 
--

--
-- Definition for stored procedure ReadAllPartnerType : 
--

CREATE PROCEDURE [dbo].[ReadAllPartnerType]
(@part_actual    udd_type)

AS
   SELECT
      part_code    = PartnerType.part_code,
      part_name    = PartnerType.part_name,
      part_actual  = PartnerType.part_actual,
	  part_user    = PartnerType.part_muser,
      part_date    = PartnerType.part_mdate
   FROM  PartnerType
   WHERE PartnerType.part_actual >= @part_actual
     AND PartnerType.part_deleted = 0
   ORDER BY
      PartnerType.part_name
