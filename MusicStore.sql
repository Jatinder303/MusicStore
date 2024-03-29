USE [master]
GO
/****** Object:  Database [MusicStore]    Script Date: 6/08/2019 3:53:22 PM ******/
CREATE DATABASE [MusicStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MusicStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MusicStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicStore] SET  MULTI_USER 
GO
ALTER DATABASE [MusicStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicStore] SET QUERY_STORE = OFF
GO
USE [MusicStore]
GO
/****** Object:  Table [dbo].[CD]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CD](
	[CDID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerIDFK] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Artist] [nvarchar](max) NULL,
	[Genre] [nvarchar](max) NULL,
 CONSTRAINT [PK_CD] PRIMARY KEY CLUSTERED 
(
	[CDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[OwnerCD]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OwnerCD]
AS
SELECT        dbo.Owner.FirstName, dbo.Owner.LastName, dbo.CD.Name, dbo.CD.Artist, dbo.CD.Genre
FROM            dbo.CD INNER JOIN
                         dbo.Owner ON dbo.CD.OwnerIDFK = dbo.Owner.OwnerID
GO
/****** Object:  Table [dbo].[CDTracks]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDTracks](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[CDIDFK] [int] NULL,
	[CDTrackID] [int] NULL,
	[TrackName] [nvarchar](max) NULL,
	[TrackDuration] [nvarchar](max) NULL,
 CONSTRAINT [PK_CDTracks] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[CountOfTracks]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountOfTracks]
AS
SELECT        TOP (100) PERCENT dbo.CD.Name, COUNT(dbo.CDTracks.TrackID) AS CountOfTracks
FROM            dbo.CD INNER JOIN
                         dbo.CDTracks ON dbo.CD.CDID = dbo.CDTracks.CDIDFK
GROUP BY dbo.CD.Name
GO
/****** Object:  View [dbo].[GroupByGenre]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GroupByGenre]
AS
SELECT        Genre, COUNT(Genre) AS GenreCount
FROM            dbo.CD
GROUP BY Genre
GO
/****** Object:  View [dbo].[UniqueGenre]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UniqueGenre]
AS
SELECT        Genre
FROM            dbo.CD
GROUP BY Genre
GO
/****** Object:  View [dbo].[MaxTracks]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MaxTracks]
AS
SELECT        MAX(CDTrackID) AS MaxTracks
FROM            dbo.CDTracks
GO
/****** Object:  View [dbo].[OwnerMaxTracks]    Script Date: 6/08/2019 3:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OwnerMaxTracks]
AS
SELECT        dbo.MaxTracks.MaxTracks, dbo.Owner.FirstName, dbo.Owner.LastName
FROM            dbo.CountOfTracks INNER JOIN
                         dbo.MaxTracks ON dbo.CountOfTracks.CountOfTracks = dbo.MaxTracks.MaxTracks INNER JOIN
                         dbo.CD INNER JOIN
                         dbo.Owner ON dbo.CD.OwnerIDFK = dbo.Owner.OwnerID ON dbo.CountOfTracks.Name = dbo.CD.Name
GO
SET IDENTITY_INSERT [dbo].[CD] ON 

INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (1, 1, N'ABBA Gold: Greatest Hits', N'ABBA', N'Pop')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (2, 1, N'Led Zeppelin IV', N'Led Zeppelin', N'Pop')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (3, 2, N'	Their Greatest Hits (1971–1975)', N'Eagles', N'Hard rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (4, 2, N'Saturday Night Fever', N'Bee Gees', N'Soundtrack')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (5, 3, N'The Dark Side of the Moon', N'Pink Floyd', N'Progressive rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (6, 3, N'Bat Out of Hell', N'Meat Loaf', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (7, 4, N'Rumours', N'Fleetwood Mac', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (8, 4, N'	Sgt. Pepper''s Lonely Hearts Club Band', N'The Beatles', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (9, 5, N'Goodbye Yellow Brick Road', N'Elton John', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (10, 5, N'Born in the U.S.A.', N'Bruce Springsteen', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (11, 6, N'1984', N'David Bowie', N'Rock')
INSERT [dbo].[CD] ([CDID], [OwnerIDFK], [Name], [Artist], [Genre]) VALUES (16, 6, N'Rock and Roll Forever', N'Bavid Dowie', N'Soundtrack')
SET IDENTITY_INSERT [dbo].[CD] OFF
SET IDENTITY_INSERT [dbo].[CDTracks] ON 

INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (1, 1, 1, N'Dancing Queen', N'3:45')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (2, 1, 2, N'Knowing Me, Knowing You', N'4:00')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (3, 1, 3, N'Take a Chance on Me', N'4:01')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (4, 1, 4, N'Mamma Mia', N'3:42')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (5, 1, 5, N'Lay All Your Love on Me', N'3:32')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (6, 1, 6, N'Ring Ring', N'3:02')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (7, 1, 7, N'I Do, I Do, I Do, I Do, I Do', N'3:15')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (8, 1, 8, N'The Winner Takes It All', N'4:54')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (9, 1, 9, N'Money, Money, Money', N'3:05')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (10, 1, 10, N'S.O.S', N'3:19')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (11, 2, 1, N'Black Dog', N'4:54')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (12, 2, 2, N'Rock and Roll', N'3:40')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (13, 2, 3, N'The Battle of Evermore', N'5:51')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (14, 2, 4, N'Stairway to Heaven', N'8:02')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (15, 3, 1, N'Take It Easy', N'3:29')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (16, 3, 2, N'Witchy Woman', N'4:10')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (17, 3, 3, N'Lyin'' Eyes', N'6:21')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (18, 3, 4, N'Already Gone', N'4:13')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (19, 4, 1, N'Stayin'' Alive', N'4:45')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (20, 4, 2, N'How Deep Is Your Love', N'4:05')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (21, 4, 3, N'Night Fever', N'3:33')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (22, 4, 4, N'More Than a Woman', N'3:18')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (23, 5, 1, N'Speak to Me', N'1:30')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (24, 5, 2, N'Breathe', N'2:43')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (25, 5, 3, N'On the run', N'3:30')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (26, 5, 4, N'Time', N'6:53')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (27, 5, 5, N'The great gig int eh sky', N'4:15')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (28, 6, 1, N'Bat Out of Hell', N'9:45')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (29, 6, 2, N'You Took the Words Right out of My Mouth (Hot Summer Night)', N'5:04')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (30, 6, 3, N'Heaven Can Wait', N'4:38')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (31, 6, 4, N'All Revved Up with No Place to Go', N'4:19')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (32, 7, 1, N'Second Hand News', N'2:43')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (33, 7, 2, N'Dreams', N'4:14')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (34, 7, 3, N'never going back again', N'2:02')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (35, 7, 4, N'Don''t Stop', N'3:11')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (36, 7, 5, N'Go your own way', N'3:38')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (37, 8, 1, N'With a Little Help from My Friends', N'2:02')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (38, 8, 2, N'Lucy in the Sky with Diamonds', N'2:44')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (39, 8, 3, N'Getting better', N'3:28')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (40, 8, 4, N'Fixing a Hole', N'2:48')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (41, 9, 1, N'Funeral for a Friend/Love Lies Bleeding', N'11:09')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (42, 9, 2, N'Candle in the Wind', N'3:50')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (43, 9, 3, N'Bennie and the Jets', N'5:23')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (44, 9, 4, N'Goodbye Yellow Brick Road', N'3:13')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (45, 10, 1, N'Born in the U.S.A.', N'4:39')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (46, 10, 2, N'Cover Me', N'3:27')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (47, 10, 3, N'Darlington County', N'4:49')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (48, 10, 4, N'Working on the Highway', N'3:11')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (49, 10, 5, N'Downbound Train', N'3:35')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (50, 10, 6, N'I''m on fire', N'2:37')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (51, 11, 1, N'No Idea', N'3:00')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (52, 11, 2, N'Still No Idea', N'3:00')
INSERT [dbo].[CDTracks] ([TrackID], [CDIDFK], [CDTrackID], [TrackName], [TrackDuration]) VALUES (53, 11, 3, N'Oh Dear', N'3:00')
SET IDENTITY_INSERT [dbo].[CDTracks] OFF
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (1, N'John', N'Smith')
INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (2, N'Arnold', N'Swartznager')
INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (3, N'Harry', N'Houdini')
INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (4, N'Barry', N'Bartholomew')
INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (5, N'Craig', N'Carick')
INSERT [dbo].[Owner] ([OwnerID], [FirstName], [LastName]) VALUES (6, N'Pablo', N'Rod')
SET IDENTITY_INSERT [dbo].[Owner] OFF
ALTER TABLE [dbo].[CD]  WITH CHECK ADD  CONSTRAINT [FK_CD_Owner] FOREIGN KEY([OwnerIDFK])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[CD] CHECK CONSTRAINT [FK_CD_Owner]
GO
ALTER TABLE [dbo].[CDTracks]  WITH CHECK ADD  CONSTRAINT [FK_CDTracks_CD] FOREIGN KEY([CDIDFK])
REFERENCES [dbo].[CD] ([CDID])
GO
ALTER TABLE [dbo].[CDTracks] CHECK CONSTRAINT [FK_CDTracks_CD]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "CDTracks"
            Begin Extent = 
               Top = 0
               Left = 420
               Bottom = 130
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2865
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountOfTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountOfTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupByGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupByGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CDTracks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MaxTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MaxTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Owner"
            Begin Extent = 
               Top = 21
               Left = 431
               Bottom = 134
               Right = 601
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OwnerCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OwnerCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CountOfTracks"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CD"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Owner"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MaxTracks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 85
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OwnerMaxTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OwnerMaxTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OwnerMaxTracks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UniqueGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UniqueGenre'
GO
USE [master]
GO
ALTER DATABASE [MusicStore] SET  READ_WRITE 
GO
