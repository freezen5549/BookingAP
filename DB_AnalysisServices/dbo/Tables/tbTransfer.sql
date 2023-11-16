CREATE TABLE [dbo].[tbTransfer] (
    [Sn]       INT            IDENTITY (1, 1) NOT NULL,
    [UserID]   NVARCHAR (10)  NOT NULL,
    [StoreID]  NVARCHAR (10)  NOT NULL,
    [Meal]     NVARCHAR (50)  NOT NULL,
    [Quantity] INT            NOT NULL,
    [Notes]    NVARCHAR (500) NULL,
    [OrderDT]  DATETIME       NOT NULL
);

