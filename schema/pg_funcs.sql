DROP FUNCTION scraper.update_time_stamp_column();
--
-- Name: update_time_stamp_column(); Type: FUNCTION; Schema: scraper; Owner: scraper
--

CREATE FUNCTION update_time_stamp_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
	NEW.time_stamp = now();
	return NEW;
    END;
$$;


ALTER FUNCTION scraper.update_time_stamp_column() OWNER TO scraper;

