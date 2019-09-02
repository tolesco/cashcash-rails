# cashcash-rails
![cashcash-rails preview](https://cashcash-html.s3.amazonaws.com/cashcash-rails-header-preview.png)

## About The Project
cashcash-rails is a self hosted app for personal finance and money management.

### Built With
cashcash-rails was developed using the follow frameworks and libraries:

* [Bootstrap 4](https://getbootstrap.com)
* [JQuery](https://jquery.com)
* [Ruby on Rails](https://rubyonrails.org/)
* [Forked theme from Simple Sidebar Template by Start Bootstrap](https://github.com/tolesco/cashcash-html)

### Preview

A demo is available on [Heroku](https://cashcash-rails.herokuapp.com/). User: `demo@example.com` and Password: `test123`

See the screenshots and mockups in [cashcash-html](https://github.com/tolesco/cashcash-html) repository.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a production system like Heroku.

### Prerequisites

You will need to have Ruby on Rails 5.2.3 installed on your system. We recommended you to follow the [GoRails Setup Ruby on Rails Guide](https://gorails.com/setup).

### Installing

Once you have Ruby on Rails 5.2.3 properly installed and configured you can make:

```
git clone https://github.com/tolesco/cashcash-rails.git
cd cashcash-rails
bundle install
rails db:create
rails db:migrate
rails s
```

#### Environment variables

We recommend to use [dotenv-rails gem](https://github.com/bkeepers/dotenv) to load your environment variables (ENV) in your development stage. In a live production system like Heroku you can avoid this steps setting the ENV variables directly. See [Heroku Configuration and Config Vars](https://devcenter.heroku.com/articles/config-vars) for more information.  

Create a '.env' file in the root of your application and asign your secrets keys their like:

```
SECRET_NAME=VALUE
```
Set your own keys for this variables. We use [Mailgun](https://www.mailgun.com/) for email notifications and [Amazon S3](https://aws.amazon.com/s3/) for files storage.

```
MAILGUN_API_KEY=VALUE
MAILGUN_DOMAIN=VALUE
AWS_ACCESS_KEY_ID=VALUE
AWS_SECRET_ACCESS_KEY=VALUE
AWS_S3_REGION=VALUE
AWS_S3_BUCKET=VALUE
APP_HOSTNAME=VALUE
APP_DOMAIN=VALUE
```
APP_DOMAIN is like `example.com`and APP_HOSTNAME is like `www.example.com`. This variables are used to send email notifications. Default storage in development is `:local` 

### Example data

cashcash-rails use [Faker](https://github.com/faker-ruby/faker) to seed example data for testing purposes. First you need to register as a user in the application, then you can seed your database with `rails db:seed`. Also remember to uncomment the lines in `db/seeds.rb`file before run the seed command.

## Features

Features in current version are:

* Signup with email account (Devise)
* Dashboard with helpful information
* Can create, update and delete categories
* Can create, update, archive and unarchive accounts
* Can create, update and delete transactions
* Can attach an inovice file to a transaction
* Can attach an cfdi_pdf and cfdi_xml files (SAT Mexico only) to a transaction
* Can search transactions by keyword in description
* Can filter transactions by account, category and date

## Restrictions

* cashcash-rails is released as a self-hosted and single user app. To support multiple users you need to extended it.
* Account types are statically defined as an enum in the Account class.
* Uncategorized income and uncategorized expense categories can't be removed.
* User can't trash an archived account.

## Roadmap

See the [open issues](https://github.com/tolesco/cashcash-rails/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/NewFeature`)
3. Commit your Changes (`git commit -m 'Add some NewFeature'`)
4. Push to the Branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Contact

Jesús Francisco Rodríguez Pérez - [@tolesco](https://github.com/tolesco/) - tolesco@gmail.com
