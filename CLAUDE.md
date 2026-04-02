# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Cizrna is a Ruby gem that finds company contact information (executive phone numbers and emails) using Google Gemini with Google Search grounding. Designed for Czech companies — uses IČO (company ID) for verification and Czech-language prompts.

- **Ruby >= 3.2.0**
- **LLM:** Google Gemini via `ruby_llm` gem with Google Search tool
- **Input:** Company name + IČO
- **Output:** Structured JSON with contacts, confidence scores, and source URLs

## Commands

```bash
bin/setup            # Install dependencies
bin/console          # IRB session with gem loaded
bundle exec rake     # Run default tasks (currently empty)
```

## Configuration

```ruby
Cizrna.configure do |config|
  config.gemini_api_key = ENV.fetch("GEMINI_API_KEY")
  config.model = "gemini-3-flash-preview"  # optional, this is the default
end
```

Environment variables: `GEMINI_API_KEY` (required), `CIZRNA_MODEL` (optional override).

## Architecture

| File | Responsibility |
|------|----------------|
| `lib/cizrna.rb` | Main module; `configure`, `find_contact` class methods |
| `lib/cizrna/configuration.rb` | API key and model config; applies via `RubyLLM.configure` |
| `lib/cizrna/contact_finder.rb` | Constructs Czech-language prompt, calls Gemini with Google Search tool, parses/validates JSON |
| `lib/cizrna/version.rb` | Version constant (0.1.0) |

### Public API

```ruby
result = Cizrna.find_contact(company_name: "Firma s.r.o.", ico: "12345678")
# => {
#   "company_name" => "Firma s.r.o.",
#   "ico" => "12345678",
#   "contacts" => [
#     { "name" => "Jan Novák", "role" => "jednatel",
#       "phone" => "+420123456789", "email" => "jan@firma.cz" }
#   ],
#   "sources" => ["https://..."],
#   "confidence" => 0.85
# }
```

### Error Classes

- `Cizrna::Error` — base error
- `Cizrna::ExtractionError` — raised when JSON parsing fails from LLM response

## Dependencies

| Gem | Purpose |
|-----|---------|
| `ruby_llm` | Gemini API + Google Search integration |

Dev: `dotenv`, `rubocop-rails-omakase`

## Examples

`examples/find_contacts.rb` — bulk company lookup from CSV (`data/source/contacts_sample.csv`), with rate limiting (2s sleep between requests), outputs to `data/output/contacts.json`.

## Code Style

- `frozen_string_literal: true` everywhere
- Follow `rubocop-rails-omakase` style guide
- Double quotes for strings
- No test framework configured yet
