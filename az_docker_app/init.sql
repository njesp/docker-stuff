revoke create on schema public from public;
create role demo login password 'demopwd' inherit;
grant all privileges on database demodb to demo;
