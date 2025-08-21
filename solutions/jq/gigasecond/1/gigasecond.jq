def convert_to_iso8601:
    # ISO8601 date format: "YYYY-MM-DDTHH:MM:SSZ"
    (. / "T") as [$date, $time] 
    | ($date / "-") as [$year, $month, $day]
    | (($time // "00:00:00") / ":") as [$hours, $minutes, $seconds]
    | "\($year)-\($month)-\($day)T\($hours):\($minutes):\($seconds)Z";
    
1000000000 as $leap
| .moment
| convert_to_iso8601
| fromdateiso8601 + $leap
| todateiso8601[:-1]
