-- Create a PL/SQL file named "student_example.sql"

spool raj.txt
select TICKET_NUMBER
from FD.CMS_TICKET;
spool off

