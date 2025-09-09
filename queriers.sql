select sum(CAST(rushing_yards AS INTEGER)) 
from bills 
where posteam = 'BUF' AND season = '2024' AND season_type = 'REG';

select week, sum(rushing_yards)
from bills
where posteam = 'BUF' AND season = '2024' AND season_type = 'REG'
group by week
order by sum(rushing_yards) desc

SELECT COUNT(*) AS total_offensive_plays
FROM bills
WHERE posteam = 'BUF'
  AND season = '2024'
  AND season_type = 'REG'
  AND (
    play_type = 'run'
    OR play_type = 'pass'
    OR play_type = 'qb_kneel'
    OR (play_type = 'no_play' AND desc NOT LIKE '%Penalty%' AND desc NOT LIKE '%Aborted%')
  );

SELECT
  SUM(
    CASE
      WHEN interception = 1 THEN -CAST(passing_yards AS INTEGER)
      ELSE CAST(passing_yards AS INTEGER)
    END
  ) AS total_passing_yards
FROM bills
WHERE posteam = 'BUF'
  AND season = '2024'
  AND season_type = 'REG'
  AND play_type = 'pass'
  AND passing_yards IS NOT NULL
  AND passing_yards != '';