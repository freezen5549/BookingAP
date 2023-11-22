-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspUserInsert]
(
	@UserName        nvarchar(50),
	@UserType        nvarchar(5),
	@UserAccount     nvarchar(200),
	@UserPassword    nvarchar(200)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY  
		INSERT Booking.dbo.tbUserInfo 
		VALUES (
				@UserName,
				@UserType,
				@UserPassword,
				@UserAccount
				)

		SELECT COUNT(UserAccount) as UserCount
		  FROM Booking.dbo.tbUserInfo
		 WHERE UserAccount = @UserAccount
	END TRY 
	BEGIN CATCH  
	END CATCH 
	
	SET NOCOUNT OFF;
END