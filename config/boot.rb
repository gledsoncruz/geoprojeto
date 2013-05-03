require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
#ENV['NLS_LANG'] = 'pt_BR.UTF-8'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
