revoke create on schema public
from
    public;

create role demo login password 'demopwd' inherit;

grant all privileges on database demodb to demo;

drop table if exists visits;

create table visits (
    time_of_visit timestamp(6) not null default current_timestamp
    , client_ip inet not null
);

create index time_of_visit_ix on visits (time_of_visit);

grant insert , select on visits to demo;

