-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspUserExist]
(
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
		SELECT count(UserID)
		  FROM [dbo].tbUserInfo
		 WHERE UserAccount = @UserAccount
		   and UserPassword = @UserPassword
	END TRY 
	BEGIN CATCH  
		 SET @ErrorMessage = ERROR_MESSAGE();
	END CATCH 
	
	SET NOCOUNT OFF;
END