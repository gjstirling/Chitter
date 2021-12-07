# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './spec/database_helpers.rb'
require './lib/post.rb'
require './lib/user.rb'
