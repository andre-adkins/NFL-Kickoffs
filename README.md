# Analyzing the State of the NFL's Kickoff Returns
In this project, I analyze NFL kickoff data from the 2005-06 to 2023-24 seasons and determine if a rule change should be implemented. The data was retrieved from the [Official NFL Stats Website](https://www.nfl.com/stats/team-stats/).

## Programs Used
+ **SQL:** Used to collect, clean, join, and transform the data. <be>
+ **R Studio:** Used to transform data further and create the data visualizations of the results.
  + Packages used: *tidyverse, ggplot2*.

## Data Definitions
  + **Avg Yards per Return (`Avg`):** Average number of yards gained on a team's kickoff return.<br>
  + **Total Kick Returns (`Ret`):** Total number of kickoffs returned (does not include touchbacks or kicks out-of-bounds).<br>
  + **Total Kick Return Yards (`Yds`):** Total number of yards gained when returning kickoffs (does not include touchbacks or kicks out-of-bounds).<br>
  + **Total Kick Return Touchdowns (`KRet_TD`):** Total number of kickoffs returned for a touchdown.<br>
  + **20-yd Returns (`20_yd_returns`):** Total number of kickoff returns that totaled 20+ yards.<br>
  + **40-yd Returns (`40_yd_returns`):** Total number of kickoff returns that totaled 40+ yards.<br>
  + **Long:** The longest single kickoff return.<br>
  + **Fair Catches (`Fair_Catch`):** Total number of fair catches - an unhindered catch of an airborne scrimmage kick that has crossed the line of scrimmage, or an airborne free kick, by a player of the receiving team who has given a valid fair catch signal.<br>
  + **Kickoffs (`Kickoffs`):** Total number of kickoffs (as kicking team).<br>
  + **Kickoff Yards Allowed (`Yds_Allowed`):** Total number of yards gained by the opposing teams of kickoffs.<br>
  + **Total Touchbacks (`Touchbacks`):** Total number of times a player downs the ball after a free kick behind his team’s own goal line, or the ball is kicked through the back of the end zone. The play is dead and the ball is spotted on the 25-yard line..<br>
  + **Touchback Percentage (`TB%`):** Ratio between the number of touchbacks vs. the total number of kickoffs.<br>

## Skills Used
- Data Cleaning (changing column names)
- Data Transformation (joining tables, data aggregation, creating columns based on calculations)
- Aggregate Functions
- Data Visualization (line and bar graphs)

## Introduction
There once was a time when there were dynamic kickoff/punt return guys: players that every time they touched the ball, there was a chance that it was going "to the house". Dante Hall, Cordarrelle Patterson, Percy Harvin, DeSean Jackson, Josh Cribbs, Darren Sproles, and who could forget the NFL Hall of Famer Devin Hester. Kickoffs were an exciting part of watching an NFL game whether it be on Sunday, Monday, or Thursday. However, the increase in injuries on kickoffs has caused the NFL to find a way to mitigate them. This has led to multiple years where the league changed the rules for this special teams play. *(This project examines data starting from the 2005-06 NFL Season, thus rule changes occurring from that season on will be highlighted.)*

| Year | Rule Change(s)|
|---|---|
| 2006 | -A minimum of 4 kicking team players must be on both sides of the ball |
| 2008 | -Kickoff must be made at the restraining line, removing an option to place anywhere behind|
| 2009 | -No wedge blocking of 3 or more players <br>-Kicking team must have on each side of the ball at least 3 players outside the hashmarks including 1 outside the numbers <br>-Removed the onside kick exception entirely|
| 2011 | -Kicking team players must be no more than 5 yards behind the ball <br>-Kickoff from the 35-yard line <br>-Receiving team lines up 25 yds from kickoff spot and 30 yds on safety kicks|
| 2016 | -Touchbacks on kickoffs go to the 25-yard line|
| 2018 | -No contact 15 yards from kickoff spot until ball touches a player or the ground<br>-No 2-player blocking by deep players and no 2-man wedge blocks <br>-Kicking team players must be no more than 1 yard behind the ball and no prekick motion<br>-Kicking team players must have 5 on either side of the ball (at least 2 between hashmarks and numbers, at least 2 outside numbers)<br>-Receiving team must have 8 players within the "setup zone" (15-yd zone between 10-25 yards from the ball)<br>-Receiving team cannot exit the setup zone on either side until the ball touches the ground or a player<br>-An untouched kick is a touchback when it touches the ground in the end zone |
| 2021 | -Receiving team is permitted to have a 9th player in the setup zone at their option|
| 2023 | -A fair catch inside the 25-yard line is a touchback to the 25 (only for this season)|


```SQL
/* Join the two tables, adjust column names, and create a new table named "kickoff_data" */
CREATE TABLE NFLdata.kickoff_data AS
(SELECT NFLdata.kickoff_returns.*,
  kickoffs.Kickoffs, kickoffs.Yds AS Yds_Allowed, kickoffs.Touchbacks, kickoffs.`TB(pct)` AS `TB%`, kickoffs.Ret AS Ret_Allowed,
  kickoffs.Ret_Avg AS Ret_Avg_Allowed, kickoffs.OSK, kickoffs.OSK_Rec, kickoffs.OOB, kickoffs.Touchdowns_Allowed
FROM NFLdata.kickoff_returns
JOIN NFLdata.kickoffs ON kickoff_returns.Year = kickoffs.Year AND kickoff_returns.Team= kickoffs.Team)
```
```SQL
/* Group data by YEAR and compute appropriate aggregate functions */
SELECT kickoff_data.Year, ROUND(avg(kickoff_data.Avg), 2) AS Avg_Yds_Per_Return, ROUND(avg(kickoff_data.Yds), 2) AS Avg_KRet_Yds_Per_Season, 
  sum(kickoff_data.KRet_TD) AS Total_KRet_TD, sum(kickoff_data.`20_yd_returns`) AS Total_20_Yd_Returns, sum(kickoff_data.`40_yd_returns`) AS 
  Total_40_Yd_Returns, sum(kickoff_data.`Fair Catch`) AS Total_Fair_Catches, sum(kickoff_data.Touchbacks) AS Total_Touchbacks, 
  ROUND(avg(kickoff_data.Ret_Allowed), 0) AS Avg_Ret_Allowed
FROM NFLdata.kickoff_data
GROUP BY Year
```


