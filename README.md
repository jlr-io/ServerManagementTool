(This manual assumes a CentOS 7 or RHEL 7.5 environment)

Ruby on Rails Web Application:
Necessary Installations:
Ruby v.2.5.3
Rails v.5.2.1
Postgres v.9.6
Node.js v.6.14.3 
Audited | https://github.com/collectiveidea/audited

Service.py:
Necessary Installations:
Python2.7
Psycopg2 | http://initd.org/psycopg/
inxi | https://github.com/smxi/inxi

Scheduling:
cron | http://man7.org/linux/man-pages/man8/cron.8.html

Functionality:
Our Server Management Tool (SMT) seeks to streamline the process of performing CRUD operations on an inventory of servers. While providing surveillance of the servers to generate accurate periodic reporting on the hardware and system running on the server. And maintaining an updated log of all interactions going on in the system for auditing and reporting purposes. The Tool also displays key information visually so that it can be easily digested by managerial staff.
  
Employee:
Login.
View dashboard.
Request new server.
Request new ticket.
Search for and view approved servers.
Search for and view pending servers (of the users creation).

Admin:
Login.
View Dashboard.
Search for, read, update, or delete servers (approved or pending).
Search for, read, update, or delete tickets.
Create, read, update, or delete users.
