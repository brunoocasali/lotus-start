require 'lotus/router'
require 'lotus/controller'
require 'lotus/view'
require_relative 'lotus'

class HomeController
  include Lotus::Controller

  action 'Index' do
    expose :planet

    def call(params)
      @planet = 'World'
    end
  end
end

module Home
  class Index
    include Lotus::View

    def salutation
      'Hello'
    end

    def greet
      "#{salutation}, #{planet}!"
    end
  end
end

Lotus::View.configure do
  root __dir__ + '/templates'
end
Lotus::View.load!

router = Lotus::Router.new do
  get '/', to: 'home#index'
end

Application = Rack::Builder.new do
  run Lotus::Application.new(router)
end.to_app
