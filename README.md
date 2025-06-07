# 🚀 Tech Stack

- Ruby: `3.2.2`
- Ruby on Rails: `8.0.2`
- Database: `sqlite3`

# ⚙️ Setup Instructions

## 1. Install dependencies

######

    bundle install

## 2. Setup the database

######

    rails db:migrate

## 3. Create the environment file

######

    cp .env.example .env

## 4. Fill in your environment variables in `.env`

######

    QISCUS_APP_ID = your_app_id
    QISCUS_BASE_URL = https://example-url.com
    QISCUS_SECRET_KEY = your_secret_key

## 5. Run the project

######

    rails s
