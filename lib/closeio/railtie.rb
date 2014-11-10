module Closeio
  class Railtie < Rails::Railtie

    initializer "setup closeio" do
      config_file = Rails.root.join("config", "closeio.yml")
      if config_file.file?
        Closeio::Config.config = YAML.load(ERB.new(config_file.read).result)[Rails.env]
        Closeio::Base.basic_auth Closeio::Config.api_key, ''
      end
    end
  end
end
