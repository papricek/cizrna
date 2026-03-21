# frozen_string_literal: true

require "ruby_llm"

require_relative "cizrna/version"
require_relative "cizrna/configuration"
require_relative "cizrna/contact_finder"

module Cizrna
  class Error < StandardError; end
  class ExtractionError < Error; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration.apply!
    end

    def find_contact(company_name:, ico:)
      ContactFinder.new(company_name: company_name, ico: ico, model: configuration.model).call
    end
  end
end
