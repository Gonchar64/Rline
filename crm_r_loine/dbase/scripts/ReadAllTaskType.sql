USE [VL]
GO
/****** Объект:  StoredProcedure [dbo].[ReadAllTaskType]    Дата сценария: 05/14/2013 11:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Definition for stored procedure ReadAllTaskType : 
--

--
-- Definition for stored procedure ReadAllTaskType : 
--

CREATE PROCEDURE [dbo].[ReadAllTaskType]
(@tt_actual    udd_type)

AS
   SELECT
      tt_code    = TaskType.tt_code,
      tt_name    = TaskType.tt_name,
      tt_actual  = TaskType.tt_actual,
      tt_user    = TaskType.tt_muser,
      tt_date    = TaskType.tt_mdate
   FROM  TaskType
   WHERE TaskType.tt_actual >= @tt_actual
     AND TaskType.tt_deleted = 0
   ORDER BY
      TaskType.tt_name
