#!/usr/bin/env bash

command1() {
	apt install -y curl ca-certificates gnupg
	curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg > /dev/null
	echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
	apt update && apt install -y postgresql-14
}

command2() {
	su - postgres << EOF
createdb dvdrental
pg_restore -U postgres -d dvdrental /work/dvdrental.tar
EOF
}

command1 && command2
