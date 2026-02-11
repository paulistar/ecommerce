# Database

This folder contains SQL for bootstrapping the database.

- `charmefitness_schema.sql`: tables/indexes only (no INSERT data)
- `charmefitness_seed.sql`: safe seed data (cities/states/districts + catalog tables; excludes users/config)

Import example (inside the MariaDB container):
```sh
mariadb -u root -p "$MARIADB_DATABASE" < db/charmefitness_schema.sql
mariadb -u root -p "$MARIADB_DATABASE" < db/charmefitness_seed.sql
```
