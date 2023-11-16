-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStoreQuery]
	-- Add the parameters for the stored procedure here
(
	@ID             nvarchar(10),
	@Name           nvarchar(50),
	@ErrorMessage   nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY 
    -- Insert statements for procedure here
		SELECT Meal,Price
		  FROM Booking.dbo.tbStore
		 WHERE (@ID IS NOT NULL OR ID like '%' + @ID + '%')
		   and (@Name IS NOT NULL OR Name like '%' + @Name + '%')
	END TRY
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END