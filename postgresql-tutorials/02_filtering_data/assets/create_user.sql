CREATE USER packer WITH PASSWORD 'packer';
GRANT ALL PRIVILEGES ON DATABASE dvdrental TO packer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO packer;
