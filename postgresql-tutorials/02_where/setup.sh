#!/usr/bin/env bash

command1() {
	apt install -y postgresql-common
	sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
	apt update && apt install -y postgresql-14
}

command1 &
PID=$!
wait $PID
su - postgres
createdb dvdrental
pg_restore -U postgres -d dvdrental /work/dvdrental.tar
psql < /work/create_user.sql
su - packer
