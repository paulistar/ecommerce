# Database

This folder contains SQL for bootstrapping the database.

- `charmefitness_schema.sql`: tables/indexes only (no INSERT data)
- `charmefitness_seed.sql`: safe seed data (cities/states/districts + catalog tables; excludes users/config)
- `charmefitness_full.sql`: full dump (includes users/config/PII). Added only because the repo is private and you explicitly accepted the risk.

Import example (inside the MariaDB container):
```sh
mariadb -u root -p "$MARIADB_DATABASE" < db/charmefitness_schema.sql
mariadb -u root -p "$MARIADB_DATABASE" < db/charmefitness_seed.sql
```
