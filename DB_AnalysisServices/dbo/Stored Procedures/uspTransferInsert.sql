-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE uspTransferInsert
(
	@UserID         nvarchar(10),
	@StoreID        nvarchar(50),
	@Meal           nvarchar(5),
	@Quantity       int,
	@Notes          nvarchar(500),
	@ErrorMessage   nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY  
		INSERT Booking.dbo.tbTransfer (UserID,StoreID,Meal,Quantity,Notes,OrderDT)
		VALUES (@UserID,
				@StoreID,
				@Meal,
				@Quantity,
				@Notes,
				GETDATE())
	END TRY
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END