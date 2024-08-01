# Analyzing the State of the NFL's Kickoff Returns
In this project, I analyze NFL kickoff data from the 2005-06 to 2023-24 seasons and determine if a rule change should be implemented. The data was retrieved from the [Official NFL Stats Website](https://www.nfl.com/stats/team-stats/).

[Click here to see the official project. (HTML)](https://htmlpreview.github.io/?https://github.com/andre-adkins/NFL-Kickoffs/blob/main/NFL_Kickoffs.html)

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
There was a time when the NFL featured dynamic kickoff and punt return specialists, players whose mere touch of the ball could potentially result in a touchdown. Notable figures such as Dante Hall, Cordarrelle Patterson, Percy Harvin, DeSean Jackson, Josh Cribbs, Darren Sproles, and the esteemed NFL Hall of Famer Devin Hester exemplified this electrifying aspect of the game. Kickoff returns added a thrilling dimension to NFL games, whether on Sundays, Mondays, or Thursdays. However, the rise in injuries associated with kickoffs has prompted the NFL to seek ways to address this issue. Consequently, the league has implemented rule changes over several years to enhance player safety during these special teams plays. *(This study focuses on data from the 2005-06 NFL Season onwards, emphasizing rule modifications introduced from that period.)*
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
