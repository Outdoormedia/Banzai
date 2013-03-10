TRUNCATE TABLE audiences;

INSERT INTO `audiences`(`id`,`demog_id`,`region_code`,`format_id`,`weight`,`reach`,`contacts`,`region_pop`,`avg_freq`,`duration`,`market_id`,`reach_persons`)
VALUES
(1,560,1,362,1,17.14,1353130,3648698,2.16,7,18,625557),
-- 500,000 more records here

(508200,590,31,374,3,57.97,859105,173694,8.53,28,12,100683);


DROP TABLE IF EXISTS temp_bombora_to_oztam_factors;

CREATE TABLE temp_bombora_to_oztam_factors
AS
  SELECT a.demog_id, a.market_id, a.region_pop, o.population as oztam_population, o.population / a.region_pop AS pop_factor
  FROM (SELECT DISTINCT demog_id, market_id, region_pop FROM audiences) a, demog_mapping m, oztam_populations o
  WHERE a.market_id = o.region_id
  AND a.demog_id = m.planning_demog_id
  AND m.demog_id = o.demog_id;

UPDATE audiences a, temp_bombora_to_oztam_factors p
SET a.contacts      = a.contacts * p.pop_factor,
    a.reach_persons = a.reach_persons * p.pop_factor,
    a.region_pop    = p.oztam_population,
    a.reach         = 100 * a.reach_persons / a.region_pop,
    a.avg_freq      = a.contacts / a.reach_persons
WHERE a.demog_id = p.demog_id AND a.market_id = p.market_id;

DROP TABLE temp_bombora_to_oztam_factors;
