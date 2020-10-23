# Daily Diary
This is a simple sinatra web app designed to allow users to store and access daily musings online.

## Functionality
Users can:
* Add new diary entries from the homepage
* Give diary entries a title
* See a list of entry titles displayed on the homepage
* Peruse the content of old entries by clicking on the title

## Database set up

1. Connect to <code>psql</code>
2. Create database like so <code>CREATE DATABASE daily_diary</code>
3. Connect to the database using <code>\c daily_diary</code?
4. Run the SQL query located in /db/migrations/01_create_entries_table.sql
5. Create a separate test database by connection to <code>psql</code> and entering <code>CREATE DATABASE daily_diary_test</code>
6. Run through steps 2-4 to finish setting up your new test database
