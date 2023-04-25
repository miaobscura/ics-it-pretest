CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
AS
BEGIN
    DECLARE @BudgetValue decimal(18,2)
    SELECT @BudgetValue = SUM(b.Value)
    FROM dbo.Basket b
    JOIN dbo.Family f ON b.ID_Family = f.ID
    WHERE f.SurName = @FamilySurName
    IF @BudgetValue IS NOT NULL
    BEGIN
        UPDATE dbo.Family
        SET BudgetValue = (BudgetValue - @BudgetValue)
        WHERE SurName = @FamilySurName
    END
    ELSE
    BEGIN
        THROW 50000, N'Запрашиваемой семьи не существует', 1
    END
END