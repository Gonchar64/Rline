USE [VL]
GO
/****** Объект:  StoredProcedure [dbo].[FindPosition]    Дата сценария: 05/10/2013 08:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Definition for stored procedure FindPosition : 
--

CREATE PROCEDURE [dbo].[FindPosition]
(@pos_name      udd_tinyname,
 @pos_actual    udd_type)

AS

SELECT
   pos_code  = Positions.pos_code
FROM  Positions
WHERE Positions.pos_name       =  @pos_name
  AND Positions.pos_actual     >= @pos_actual
  AND Positions.pos_deleted    = 0
  AND (PATINDEX(@pos_name, Positions.pos_name)  != 0)