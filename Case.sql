• The CASE statement always goes in the SELECT clause
• CASE must include the following components: WHEN, THEN, and END. ELSE is an optional component.
• You can make any conditional statement using any conditional operator (like WHERE) between WHEN and THEN. This includes stringing together multiple conditional statements using AND and OR.
• You can include multiple WHEN statements, as well as an ELSE statement to deal with any unaddressed conditions.

//single condition
SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE 'no' END AS is_a_senior
  FROM benn.college_football_players


//multiple condition
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 THEN '201-250'
            WHEN weight > 175 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players
  
  
//better way for multiple condition, since above query is little confusing for when weight >250 and weight >200
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 AND weight <= 250 THEN '201-250'
            WHEN weight > 175 AND weight <= 200 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players
  
  
https://mode.com/resources/sql-tutorial/sql-case/
