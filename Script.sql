USE [ReactDB]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 05/19/2023 01:22:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LOGIN_NAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[MOBILE] [nvarchar](50) NULL,
	[NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Update]    Script Date: 05/19/2023 01:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_Update]
    @ID INT,
	@NAME NVARCHAR(50),
	@LOGIN_NAME NVARCHAR(50),
	@PASSWORD NVARCHAR(50),
	@MOBILE NVARCHAR(50)
AS
BEGIN
     UPDATE [dbo].[Login]
            SET [NAME] =@NAME
           ,[LOGIN_NAME]=@LOGIN_NAME
           ,[PASSWORD]=@PASSWORD
           ,[MOBILE]=@MOBILE
           WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert]    Script Date: 05/19/2023 01:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Insert]
    @ID INT,
	@NAME NVARCHAR(50),
	@LOGIN_NAME NVARCHAR(50),
	@PASSWORD NVARCHAR(50),
	@MOBILE NVARCHAR(50)
AS
BEGIN
	INSERT INTO [dbo].[Login]
			   ([NAME]
			   ,[LOGIN_NAME]
			   ,[PASSWORD]
			   ,[MOBILE])
		 VALUES
			   (@NAME
			   ,@LOGIN_NAME
			   ,@PASSWORD
			   ,@MOBILE)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDetails]    Script Date: 05/19/2023 01:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserDetails]
AS
BEGIN
SELECT * FROM dbo.Login
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteUser]    Script Date: 05/19/2023 01:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteUser]
	@Id INT
AS
BEGIN
	DELETE FROM DBO.Login WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetLoginDetails]    Script Date: 05/19/2023 01:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLoginDetails]
	@loginName VARCHAR(50), 
	@password  VARCHAR(50)
AS
BEGIN
SELECT * FROM dbo.Login WHERE LOGIN_NAME=@loginName and PASSWORD=@password
END
GO
