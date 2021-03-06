USE [VL]
GO
/****** Объект:  StoredProcedure [dbo].[CopyTaskType]    Дата сценария: 04/25/2013 22:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Definition for stored procedure CopyTaskType : 
--

--
-- Definition for stored procedure CopyTaskType : 
--

CREATE PROCEDURE [dbo].[CopyTaskType]
(@tt_code udd_code)

AS

DECLARE @tt_name     udd_name, 
        @tt_actual   udd_logical

/*      Read city data          */
SELECT
   @tt_name    = TaskType.tt_name + ' (K)',
   @tt_actual  = TaskType.tt_actual
FROM  TaskType
WHERE TaskType.tt_code    = @tt_code
  AND TaskType.tt_deleted = 0

IF (@@rowcount > 0) BEGIN
   EXECUTE dbo.InsertTaskType  @tt_name,
                               @tt_actual
END
ELSE BEGIN
   SELECT
      tt_code    = TaskType.tt_code,
      tt_name    = TaskType.tt_name
   FROM  TaskType
   WHERE 1 = 2
END
