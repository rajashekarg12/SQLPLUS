set serveroutput on
spool testfile.txt  

select * from {{TABLE_NAME2}};
@select.sql
