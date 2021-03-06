# Prodigy Take Home Assignment

## Installation

```bundle install```

## Running Unit Tests

```bundle exec rspec```

## Running Development Server

```rails s```

## API Documentation

All available commands return JSON responses.

---

```GET /countries```

Gets a list of all the countries in the database.

Optional parameter ```currency``` filters based on a country's currency.

e.g. ```GET /countries?currency=zar```

---

```GET /countries/a2/*a2*```

Gets the country with the provided alpha 2 code.

e.g. ```GET /countries/a2/za```

---

```GET /countries/a3/*a3*```

Gets the country with the provided alpha 3 code.

e.g. ```GET /countries/a3/zaf```

---

```PUT /countries/*id*/disable```

Soft-deletes a country from the database.
The id is a country id, as seen in a typical country JSON response from other commands.

e.g. ```PUT /countries/1/disable```

## Some Sample SQL for testing the development server

First, make sure to load the schema: ```rails db:schema:load```

Insert some currencies:

```sql
insert into currencies (`code`, `full_name`, `created_at`, `updated_at`) values ('ZAR', 'South African Rand', date('now'), date('now'));
insert into currencies (`code`, `full_name`, `created_at`, `updated_at`) values ('USD', 'United States Dollar', date('now'), date('now'));
```

Insert some countries:

```sql
insert into countries (`name`, `a2`, `a3`, `enabled`, `currency_id`, `created_at`, `updated_at`) values ('South Africa', 'ZA', 'ZAF', 1, 1, date('now'), date('now'));
insert into countries (`name`, `a2`, `a3`, `enabled`, `currency_id`, `created_at`, `updated_at`) values ('United States of America', 'US', 'USA', 1, 2, date('now'), date('now'));
insert into countries (`name`, `a2`, `a3`, `enabled`, `currency_id`, `created_at`, `updated_at`) values ('Zimbabwe', 'ZW', 'ZWE', 1, 2, date('now'), date('now'));
```
