USE [atum2_db_1]
GO
/****** Object:  StoredProcedure [dbo].[atum_log_insert_connection]    Script Date: 01/04/2017 12:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



--> 101110_DBÂ½ÂºÃ…Â°Â¸Â¶_(Â¾Ã†Â¶Ã³Â¸Â®Â¿Ã€ÃƒÂ¤Â³ÃŽÂ¸Âµ)_DBQuery(atum2_db_n)
-- !!!!
-- Name: atum_log_insert_connection
-- Desc: inserts connection log
-- ====
--		2006-09-14 by cmkwon, Add Parameter - @i_ServerGroupID INT
--		// 2007-11-06 by cmkwon, Â°Ã”Ã€Ã“ Â·ÃŽÂ±Ã— DB Â¼Â­Â¹Ã¶ ÂµÃ»Â·ÃŽ Â±Â¸ÃƒÃ Ã‡ÃÂ±Ã¢ - atum_Update_ConnectingServerGroupID_Of_Account() Ã‡ÃÂ·ÃŽÂ½ÃƒÃ€ÃºÂ·ÃŽ ÃƒÂ³Â¸Â®
--
ALTER PROCEDURE [dbo].[atum_log_insert_connection]
	@i_LogType					TINYINT,
	@i_IPAddress				BINARY(4),
	@i_AccountUniqueNumber		INT,
	@i_AccountName				VARCHAR(20),
	@i_ServerName				VARCHAR(20),
--	@i_ServerGroupID			INT,				-- 2006-09-14 by cmkwon, ÃƒÃŸÂ°Â¡Ã‡Ã”
	@i_PubilsherName			VARCHAR(20),			-- 2010-11 by dhjin, Â¾Ã†Â¶Ã³Â¸Â®Â¿Ã€ ÃƒÂ¤Â³ÃŽÂ¸Âµ Â·ÃŽÂ±Ã—Ã€ÃŽ.
	@i_MacAdress				VARCHAR(25)
-- // 2009-02-17 by cmkwon, MARK for Yedang					-- // 2008-09-04 by cmkwon, Â¿Â¹Â´Ã§ ÂºÂ¸Â¾ÃˆÂ°Ã¼Â·Ãƒ Â¼Ã»Â±Ã¤ Â°Ã¨ÃÂ¤ Ã€Ã»Â¿Ã« Ã‡ÃÂ±Ã¢(SQL Server 2005Ã€ÃŒÂ»Ã³Â¸Â¸ ÃÃ¶Â¿Ã¸Ã‡ÃÂ´Ã‚ Â±Ã¢Â´Ã‰) - 
AS
	INSERT INTO atum2_db_account.dbo.atum_log_connection
	VALUES (@i_LogType, GetDate(), @i_IPAddress,
			@i_AccountUniqueNumber, @i_AccountName, @i_ServerName, @i_PubilsherName)

	-- // 2007-11-06 by cmkwon, Â°Ã”Ã€Ã“ Â·ÃŽÂ±Ã— DB Â¼Â­Â¹Ã¶ ÂµÃ»Â·ÃŽ Â±Â¸ÃƒÃ Ã‡ÃÂ±Ã¢ - atum_Update_ConnectingServerGroupID_Of_Account() Ã‡ÃÂ·ÃŽÂ½ÃƒÃ€ÃºÂ·ÃŽ ÃƒÂ³Â¸Â®
	---- 2006-09-14 by cmkwon
	---- Â·ÃŽÂ±Ã—Ã€ÃŽÂ½Ãƒ(0 == @i_LogType)	==> ConnectingServerGroupIDÂ¿Â¡ @i_ServerGroupIDÂ¸Â¦ Â¼Â³ÃÂ¤Ã‡Ã‘Â´Ã™
	---- Â·ÃŽÂ±Ã—Â¾Ã†Â¿Ã´Â½Ãƒ(0 <> @i_LogType)	==> ConnectingServerGroupIDÂ¿Â¡ 0Â¸Â¦ Â¼Â³ÃÂ¤Ã‡Ã‘Â´Ã™
	--IF (0 = @i_LogType)
	--	BEGIN
	--		UPDATE atum2_db_account.dbo.td_account
	--			SET ConnectingServerGroupID = @i_ServerGroupID
	--			WHERE AccountUniqueNumber = @i_AccountUniqueNumber
	--	END
	--ELSE
	--	BEGIN
	--		UPDATE atum2_db_account.dbo.td_account
	--			SET ConnectingServerGroupID = 0
	--			WHERE AccountUniqueNumber = @i_AccountUniqueNumber
	--	END


