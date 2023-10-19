USE [Statistics]
GO

/****** Object:  Table [dbo].[CovarianceCorrelation]    Script Date: 19/10/2023 16:12:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CovarianceCorrelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NULL,
	[X] [int] NULL,
	[Y] [int] NULL
) ON [PRIMARY]
GO


