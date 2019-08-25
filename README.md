# cashcash-rails

**cashcash-rails** is a self hosted app for personal finance and money management. Developed in Ruby on Rails 5.2.3 and released under the MIT license.

## Restrictions

* cashcash-rails is designed as a single user system. Multiple users are not allowed.
* Account types are statically defined as an enum in the Account class.
* User can't recovery or trash an archived account.
* User can't edit, archive or trash an account reconciliation.
