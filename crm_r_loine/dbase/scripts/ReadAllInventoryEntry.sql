SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


--
-- Definition for stored procedure ReadAllInventoryEntry : 
--

--
-- Definition for stored procedure ReadAllInventoryEntry : 
--

CREATE PROCEDURE [dbo].ReadAllInventoryEntry

AS

SELECT
   ent_code   = Entry.ent_code,
   ine_code   = InventoryEntry.ine_inventory,
   ent_name   = Entry.ent_name,
   ent_factor = Entry.ent_factor
FROM InventoryEntry,
     Entry
WHERE 
     Entry.ent_code = InventoryEntry.ine_entry 
AND  Entry.ent_deleted = 0
ORDER BY
  Entry.ent_name
