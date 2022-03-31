## Movies Api
Ruby Rails application for JSON-API with ActiveRecord, RSpec
### Dependencies:
- Ruby 2.7.5
- PostgreSQL

### Installation:
- Clone poject
- Run bundler:

 ```shell
 $ bundle install
 ```
- Copy database.yml:
```shell
$ cp config/database.yml.sample config/database.yml
```

- Create and migrate database:

```shell
 $ bundle exec rails db:create
 $ bundle exec rails db:migrate
```

- Populate the database:

```shell
 $ bundle exec rails db:seed
```

- Run application:

 ```shell
 $ rails server
 ```

##### Tests:
To execute tests, run following commands:

```shell
 $ bundle exec rake db:migrate RAILS_ENV=test #(the first time only)
 $ bundle exec rspec
```

### Explanation of the approach:
DDD Service-based app design with step-based operations

#### Common logic:
Stock API with 2 endpoints:
1) GET ```api/movies``` - returns a list of available movies with related data
2) GET ```api/actors``` - returns a list of available actors. With the param ```/?name=<actor-name>``` searches matched actors

### License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
