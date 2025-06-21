# Job Marketplace API

A Ruby on Rails API for managing job opportunities, job seekers, and applications.


## Features

- Create and list job opportunities
- Apply to job opportunities
- Search by title, description, or client name (with `ransack`)
- Pagination with `kaminari`
- Background jobs via `Sidekiq`
- Redis caching for opportunity search results
- Business logic encapsulated in `Interactors`
- Test suite using `RSpec` and `FactoryBot`

## Tech Stack

- Ruby on Rails (API mode)
- PostgreSQL
- Redis
- Ransack
- Sidekiq
- RSpec + FactoryBot


## Local Setup

```bash
# Install dependencies
bundle install

# Set up the database
rails db:create db:migrate

# Start Sidekiq (requires Redis)
bundle exec sidekiq

# Start Rails server
rails s
```

## Main Endpoints

### `GET /opportunities`
List job opportunities, with search and pagination.

Query params supported (`q`):
- `title_cont`
- `description_cont`
- `client_name_cont`

Example:
```
/opportunities?q[title_cont]=developer&page=1
```

### `POST /opportunities`
Create a new opportunity:

```json
{
  "opportunity": {
    "title": "Ruby on Rails Developer",
    "description": "Build APIs",
    "salary": 100000,
    "client_id": 1
  }
}
```

### `POST /opportunities/:id/apply`
Apply to an opportunity:

```json
{
  "job_seeker_id": 7
}
```

## Run Tests

```bash
bundle exec rspec
```

---

## Author

Developed by [Jorge Gómez](https://github.com/jwaldimer) as part of a technical assessment.

## License

MIT — feel free to use and modify.
