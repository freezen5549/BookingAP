-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE uspStoreInsert
(
	@ID             nvarchar(10),
	@Name           nvarchar(50),
	@Meal           nvarchar(5),
	@Price          int,
	@ErrorMessage   nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY  
		INSERT Booking.dbo.tbStore
		VALUES (@ID,
				@Name,
				@Meal,
				@Price)
	END TRY
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END