data = LOAD '/dualcore/ad_data[1-2]' 
			AS (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray, 
             placement:chararray, was_clicked:int, cpc:int);

clicked = FILTER data BY was_clicked IS NOT NULL;

grouped_data = GROUP clicked ALL;

sum_all = FOREACH grouped_data GENERATE COUNT(clicked.was_clicked);

DUMP sum_all;
