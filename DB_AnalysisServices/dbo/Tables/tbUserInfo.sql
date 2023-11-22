CREATE TABLE [dbo].[tbUserInfo] (
    [UserAccount]  NVARCHAR (200) NOT NULL,
    [UserPassword] NVARCHAR (200) NOT NULL,
    [UserName]     NVARCHAR (50)  NOT NULL,
    [UserType]     NVARCHAR (5)   NOT NULL,
    CONSTRAINT [PK_tbUserInfo] PRIMARY KEY CLUSTERED ([UserAccount] ASC)
);



