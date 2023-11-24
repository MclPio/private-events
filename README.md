# Project: Private Events

This project is meant to deep dive into ActiveRecord association. Building a cite similar to Eventbrite.
link to lesson: https://www.theodinproject.com/lessons/ruby-on-rails-private-events

## Table of Contents

- [Installation](#installation)
- [Features](#features)
- [Usage](#usage)

## Installation

- clone repository:
```
git clone https://github.com/MclPio/private-events.git
```

- install gems:
```
bundle install
```

- migrate data
```
rails db:migrate
```

- optional: seed data
```
rails db:seed
```

- start server
```
rails s
```

- open in browser
```
localhost:3000
```

## Features

- Ability to sign up and log in
- User can create/edit events to then invite users
- If a user is not invited to an event, they can not view it
- If invited, a user can choose to attend the event or cancel
- Bootstrap used for basic styling

## Usage

- After running
```
rails db:seed
```
You can log in to seeded user accounts.
- email: user1@world.co
- password: 123456
