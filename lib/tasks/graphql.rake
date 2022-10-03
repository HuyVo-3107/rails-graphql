# frozen_string_literal: true

require 'graphql/rake_task'

GraphQL::RakeTask.new(
  namespace: 'graphql-ruby',
  schema_name: 'RailsGraphqlSchema',
  directory: 'tmp/graphql',
  idl_outfile: 'schema.graphql',
  json_outfile: 'schema.json'
)

namespace :graphql do
  namespace :schema do
    desc 'Generate schema for the Apollo fragment matcher'
    task dump: :environment do
      Rake::Task['graphql-ruby:schema:idl'].invoke
    end
    task json: :environment do
      Rake::Task['graphql-ruby:schema:json'].invoke
    end
  end
end
