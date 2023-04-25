CREATE VIEW dbo.vw_SKUPrice AS
SELECT *, dbo.udf_GetSKUPrice(ID_SKU) AS Price
FROM dbo.SKU