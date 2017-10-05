# name: teleport
# about: Instant search results for Discourse
# version: 0.0.1
# authors: James Kiesel (gdpelican)
# url: https://github.com/gdpelican/teleport

TELEPORT_PLUGIN_NAME ||= "teleport".freeze

enabled_site_setting :teleport_enabled

after_initialize do
  module ::Teleport
    class Engine < ::Rails::Engine
      engine_name TELEPORT_PLUGIN_NAME
      isolate_namespace Teleport
    end
  end

  ::Teleport::Engine.routes.draw do
    get "/search" => "search#search"
  end

  Discourse::Application.routes.append do
    mount ::Teleport::Engine, at: "/teleport"
  end

  class ::Teleport::SearchController < ApplicationController
    layout 'no_ember'
    skip_before_action :check_xhr

    def search
      raise Discourse::NotFound unless search_results && search_results.posts.any?
      redirect_to search_results.posts.first.topic.url
    end

    private

    def search_results
      @search_results ||= Search.new(params[:q], search_args).execute
    end

    def search_args
      {
        type_filter: 'topic',
        guardian: guardian,
        include_blurbs: false
      }
    end
  end
end
