

SELECT
    team_name,
    COUNT(1) AS no_of_matches,
    SUM(no_of_wins) AS no_of_wins,
    COUNT(1) - SUM(no_of_wins) AS no_of_losses
FROM (
    SELECT
        team_1 AS team_name,
        CASE 
            WHEN team_1 = winner THEN 1 
            ELSE 0 
        END AS no_of_wins
    FROM icc_world_cup

    UNION ALL

    SELECT
        team_2 AS team_name,
        CASE 
            WHEN team_2 = winner THEN 1 
            ELSE 0 
        END AS no_of_wins
    FROM icc_world_cup
) a
GROUP BY team_name
ORDER BY no_of_wins DESC;
