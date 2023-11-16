-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE uspUserInsert
(
	@UserID          nvarchar(10),
	@UserName        nvarchar(50),
	@UserType        nvarchar(5),
	@UserPassword    nvarchar(200),
	@UserAccount     nvarchar(200),
	@ErrorMessage    nvarchar(MAX)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY  
		INSERT Booking.dbo.tbUserInfo 
		VALUES (@UserID,
				@UserName,
				@UserType,
				@UserPassword,
				@UserAccount
				)
	END TRY 
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END