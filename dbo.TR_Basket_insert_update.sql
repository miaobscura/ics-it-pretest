CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
    UPDATE b SET
    DiscountValue = CASE WHEN i.Quantity >= 2 THEN i.Value * 0.05 ELSE 0 END
    FROM dbo.Basket b
    JOIN inserted i ON b.ID_SKU = i.ID_SKU AND b.SurName = i.SurName
END