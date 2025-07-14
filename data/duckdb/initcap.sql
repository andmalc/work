/*
Not thoroughly tested. DuckDB version used: 1.0.0
Won't work on NULLs, so input should be coalesced first.
I make no guarantees that this function will produce output equivalent to Postgres' INITCAP function.
Examples:
select INITCAP('do androids dream of electronic sheep?') => 'Do Androids Dream Of Electronic Sheep?'
select INITCAP('dJ D-wayne megens') => 'Dj D-Wayne Megens'
select INITCAP('Sa''ar 5-class corvette') => 'Sa'Ar 5-Class Corvette
select INITCAP(NULL) => SQL Error: Parameter Not Allowed Error: Cannot perform list_reduce on an empty input list
select INITCAP(coalesce(NULL, '')) => ''
*/

CREATE OR REPLACE MACRO CAP(s) AS UPPER(s[1])||LOWER(s[2:]);
CREATE OR REPLACE MACRO INITCAP(s) AS
(WITH cte AS (
    SELECT regexp_split_to_array(s, '[^A-Za-z]+') chars,
           regexp_split_to_array(s, '[A-Za-z]+') nonchars
    )
    SELECT list_reduce(
        [COALESCE(x[1], '')||CAP(COALESCE(x[2], '')) for x in zipped], 
        (x, y) -> x||y
    )
    FROM (SELECT list_zip(nonchars, chars) FROM cte) t(zipped)
);