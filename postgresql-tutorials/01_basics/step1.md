## install PostgreSQL to Ubuntu

`apt install curl ca-certificates gnupg`{{execute}}

`curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg > /dev/null`{{execute}}

`echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list`{{execute}}

`apt update`{{execute}}

`apt install postgresql-14`{{execute}}

### Alternately Install

`apt install porstgresql-common`

`sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh`

### Get Tutorial Source

`wget https://ftp.postgresql.org/pub/source/v14.1/postgresql-14.1.tar.gz`{{ececute}}
