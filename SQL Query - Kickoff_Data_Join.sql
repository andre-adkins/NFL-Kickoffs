--This code creates a table called "kickoff_data" by joining the "kickoff_returns" and "kickoffs" datasets.
--Column names changed as necessary.

CREATE TABLE NFLdata.kickoff_data AS
(SELECT NFLdata.kickoff_returns.*,
        kickoffs.Kickoffs,kickoffs.Yds AS Yds_Allowed, 
        kickoffs.Touchbacks, kickoffs.`TB(pct)` AS `TB%`, 
        kickoffs.Ret AS Ret_Allowed, 
        kickoffs.Ret_Avg AS Ret_Avg_Allowed, 
        kickoffs.OSK, 
        kickoffs.OSK_Rec, 
        kickoffs.OOB, 
        kickoffs.Touchdowns_Allowed
FROM NFLdata.kickoff_returns
JOIN NFLdata.kickoffs ON kickoff_returns.Year = kickoffs.Year AND kickoff_returns.Team= kickoffs.Team)
