# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Cizrna is a Ruby gem for finding company contact information using LLM with Google Search. Requires Ruby >= 3.2.0.

## Commands

- **Install dependencies:** `bin/setup` (or `bundle install`)
- **Interactive console:** `bin/console` (loads the gem into an IRB session)
- **Install gem locally:** `bundle exec rake install`
- **Release:** Update `lib/cizrna/version.rb`, then `bundle exec rake release`

## Architecture

- `lib/cizrna.rb` — Main entry point, defines `Cizrna` module, error classes, and `find_contact` API
- `lib/cizrna/configuration.rb` — Configuration class (API key, model selection)
- `lib/cizrna/contact_finder.rb` — Core service class using RubyLLM with Google Search
- `lib/cizrna/version.rb` — Version constant
- `sig/cizrna.rbs` — RBS type signatures
- `exe/` — Directory for CLI executables (if any are added)

No test framework is configured yet. The default Rake task is empty.
