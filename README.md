# PostgreMassLoader

Gem allow fastest loading to PostgreSQL through CSV-loading.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postgre_mass_loader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postgre_mass_loader

## Usage

loader = PostgreMassLoader::Loader.new(connection, 'employees', ['name', 'salary'])
loader.import_rows([['Scott', 1000], ['Iren', 1100]])

## Contributing

1. Fork it ( https://github.com/[my-github-username]/postgre_mass_loader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
