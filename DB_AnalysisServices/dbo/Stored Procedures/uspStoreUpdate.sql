-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStoreUpdate]
	-- Add the parameters for the stored procedure here
(
	@ID             nvarchar(10),
	@Name           nvarchar(50),
	@Meal           nvarchar(50),
	@Price          int,
	@ErrorMessage   nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRY 
    -- Insert statements for procedure here
		UPDATE Booking.dbo.tbStore 
		   SET Meal = @Meal,Price = @Price
		 WHERE ID = @ID
		   and Name = @Name
	END TRY
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END