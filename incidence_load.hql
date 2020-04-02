create external table if not exists incidences (

Dates string,
Location string,
Ers string,
Type string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://localhost:54310/user/malloc/incidences';

LOAD DATA INPATH 'hdfs://localhost:54310/user/malloc/incidences1' OVERWRITE INTO TABLE incidences;


