SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


--
-- Definition for stored procedure ReadAllReferenceGroups : 
--

--
-- Definition for stored procedure ReadAllReferenceGroups : 
--

CREATE PROCEDURE [dbo].ReadAllReferenceGroups
(@grp_type      udd_type,
 @grp_actual    udd_type,
 @grp_skip      udd_code)

AS

--SET ROWCOUNT 2000

SELECT
   grp_code   = ReferenceGroup.grp_code,
   grp_parent = ReferenceGroup.grp_parent,
   grp_name   = ReferenceGroup.grp_name,
   grp_actual = ReferenceGroup.grp_actual
FROM  ReferenceGroup
WHERE ReferenceGroup.grp_type    = @grp_type
  AND ReferenceGroup.grp_deleted = 0
  AND ReferenceGroup.grp_code   != ReferenceGroup.grp_parent
  AND ReferenceGroup.grp_code   != @grp_skip
  AND ReferenceGroup.grp_actual >= @grp_actual
ORDER BY
   ReferenceGroup.grp_priority,
   ReferenceGroup.grp_name
