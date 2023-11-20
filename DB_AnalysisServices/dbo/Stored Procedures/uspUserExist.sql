-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspUserExist]
(
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
		SELECT count(UserID) as UserCount
		  FROM [dbo].tbUserInfo
		 WHERE UserAccount = @UserAccount
		   and UserPassword = @UserPassword
	END TRY 
	BEGIN CATCH  
		
	END CATCH 
	
	SET NOCOUNT OFF;
END