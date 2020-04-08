create external table if not exists incidences (

month int,
loc string,
ers string,
typ string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://localhost:54310/user/malloc/incidences';

LOAD DATA INPATH 'hdfs://localhost:54310/user/malloc/incidences_by_month' OVERWRITE INTO TABLE incidences;


--Frequencies by variables

select month,count(*) as freq_month from incidences group by month;

select loc,count(*) as freq_loc from incidences group by loc;

select ers,count(*) as freq_ers from incidences group by ers;

select typ,count(*) as freq_typ from incidences group by typ;

--Nummbers Targets of variables

select count(distinct month) as target_month from incidences;

select count(distinct loc) as target_loc from incidences;

select count(distinct ers) as target_ers from incidences;

select count(distinct typ) as target_typ from incidences; 


--MinMax of the frequencies incidence by variables

select min(month), max(Month) , avg(month) from incidences;





--Export to ELastich Stack

ADD jar elasticsearch-hadoop-7.5.2.jar;

create external table security_data (
month int,
loc string,
ers string,
typ string
)
stored by 'org.elasticsearch.hadoop.hive.EsStorageHandler' TBLPROPERTIES('es.resource' = 'hive_incidences/security_data');

insert overwrite table security_data select inc.month, inc.loc, inc.ers,inc.typ from incidences inc; 
