module Closeio
  module Config

    class << self
      attr_accessor :config
      attr_accessor :api_key
    end

    %w(api_key).each do |method_name|
      define_singleton_method(method_name) do
        @config.fetch(method_name)
      end
      define_singleton_method("#{method_name}=") do |value|
        if @config.blank?
          @config = {method_name => value}
        else
          @config[method_name] = value
        end
      end
    end

  end
end
