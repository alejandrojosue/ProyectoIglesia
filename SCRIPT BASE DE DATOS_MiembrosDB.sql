/*** SCRIPT CREAR BASE DE DATOS MiembrosDB ****/
CREATE DATABASE [MiembrosDB]

















/**** SCRIPT dbo.Miembros ********/
USE [MiembrosDB]
GO
/****** Object:  Table [dbo].[Miembros]    Script Date: 1/4/2025 7:03:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Miembros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[colonia] [nvarchar](100) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Miembros] ADD  DEFAULT ((1)) FOR [activo]
GO









/**** SCRIPT dbo.PersonaAsistencia ****/
USE [MiembrosDB]
GO
/****** Object:  Table [dbo].[PersonaAsistencia]    Script Date: 1/4/2025 7:07:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PersonaAsistencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[miembro_id] [int] NULL,
	[fecha] [date] NOT NULL,
	[Asistencia] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PersonaAsistencia]  WITH CHECK ADD FOREIGN KEY([miembro_id])
REFERENCES [dbo].[Miembros] ([id])
GO

ALTER TABLE [dbo].[PersonaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_PersonaAsistencia_Miembros] FOREIGN KEY([miembro_id])
REFERENCES [dbo].[Miembros] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PersonaAsistencia] CHECK CONSTRAINT [FK_PersonaAsistencia_Miembros]
GO






/*** SCRIPT dbo.Usuarios***/
USE [MiembrosDB]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/4/2025 7:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO