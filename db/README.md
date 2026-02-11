# Database

This folder contains schema-only SQL for bootstrapping the database.

- `charmefitness_schema.sql`: tables/indexes only (no INSERT data)

Import example (inside the MariaDB container):
```sh
mariadb -u root -p "$MARIADB_DATABASE" < db/charmefitness_schema.sql
```

