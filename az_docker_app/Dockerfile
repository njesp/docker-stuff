FROM postgres
ENV POSTGRES_PASSWORD passwd
ENV POSTGRES_DB demodb
COPY init.sql /docker-entrypoint-initdb.d/
#
# docker build -t pgbrew:latest .
# docker run --name pgdock -d -p 5432:5432 pgbrew
# export PGPASSWORD="password"
# psql -h localhost -U demo -d demodb