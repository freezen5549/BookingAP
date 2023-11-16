-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTransferByCustQuery]
(
	@UserID         nvarchar(10),
	@ErrorMessage   nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY  
		SELECT StoreID,Meal,Quantity,Notes,OrderDT
		  FROM Booking.dbo.tbTransfer
		 WHERE UserID = @UserID
	END TRY
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END