-- Create a PL/SQL file named "student_example.sql"
Spool "raj4.txt";

select TICKET_NUMBER,TICKET_DESCRIPTION
from FD.CMS_TICKET;
