
/****** Object:  Database [Music2017]    Script Date: 29/03/2018 9:28:15 AM ******/
CREATE DATABASE [MusicStore]
GO
USE [MusicStore]
GO
/****** Object:  Table [dbo].[CD]    Script Date: 29/03/2018 9:28:15 AM ******/
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
/****** Object:  Table [dbo].[CDTracks]    Script Date: 29/03/2018 9:28:16 AM ******/
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
/****** Object:  Table [dbo].[Owner]    Script Date: 29/03/2018 9:28:16 AM ******/
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
USE [master]
GO
ALTER DATABASE [Music2017] SET  READ_WRITE 
GO
