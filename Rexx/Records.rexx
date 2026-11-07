/* Records.rexx: the project open in GFOpenBase, its tables and how many records each has.
   rx Records.rexx   (GFOpenBase running, a project open) */
OPTIONS RESULTS
IF ~SHOW('P', 'GFOPENBASE.1') THEN DO
    SAY 'GFOpenBase is not running.'
    EXIT 5
END
ADDRESS 'GFOPENBASE.1'
GETFILE
SAY 'Project:' RESULT
TABLES
list = RESULT
DO WHILE list ~= ''
    PARSE VAR list '"' name '"' list
    QUERY 'SELECT count(*) FROM "'name'"'
    SAY ' ' name':' RESULT 'records'
END
