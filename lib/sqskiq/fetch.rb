require 'celluloid'
require 'celluloid/autostart'
require 'sqskiq/aws'

module Sqskiq
  class Fetcher
    include Celluloid
    include Sqskiq::AWS

    def initialize(queue_name, receive_message_limit)
      init_queue(queue_name,receive_message_limit)
      @manager = Celluloid::Actor[:manager]
    end

    def fetch
      messages = fetch_sqs_messages
      @manager.async.fetch_done(messages)
    end

  end
end