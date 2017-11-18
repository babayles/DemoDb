CREATE TABLE [dbo].[titles]
(
	[id] [int] NOT NULL,
	[title] [varchar] (50) NOT NULL,
	CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[employees]
(
	[id] [int] IDENTITY (1,1) NOT NULL,
	[name] [varchar] (50) NOT NULL,
	[title_id] [int] NOT NULL,
	CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [dbo].[employees] ADD CONSTRAINT [FK_employees_titles] FOREIGN KEY
	(
		[title_id]
	)
	REFERENCES [dbo].[titles]
	(
		[id]
	)
GO

INSERT INTO	[dbo].titles
        ( id, title )
VALUES  
( 1, 'Engineer' ),
( 2, 'BA' ),
( 3, 'DA' ),
( 4, 'QA' ),
( 5, 'Team Leader' )