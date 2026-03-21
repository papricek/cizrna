# Cizrna

Find company contact information using LLM with Google Search.

Cizrna finds company contact details (phone, email) for executives via Gemini API with Google Search grounding. Designed for Czech companies (IČO-based lookup).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cizrna'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cizrna

## Usage

```ruby
require 'cizrna'

Cizrna.configure do |config|
  config.gemini_api_key = ENV.fetch('GEMINI_API_KEY')
  # config.model = "gemini-3-flash-preview" # optional, also configurable via CIZRNA_MODEL env var
end

result = Cizrna.find_contact(company_name: "Komerční banka, a.s.", ico: "45317054")

result["contacts"].each do |contact|
  puts "#{contact['name']} (#{contact['role']}): #{contact['phone']} / #{contact['email']}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt.

## License

The gem is available as open source.
