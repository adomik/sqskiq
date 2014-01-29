require 'celluloid'
require 'celluloid/autostart'
require 'sqskiq/aws'

module Sqskiq
  class Deleter
    include Celluloid
    include Sqskiq::AWS

    def initialize(queue_name, receive_message_limit)
      init_queue(queue_name,receive_message_limit)
    end

    def delete(messages)
      delete_sqs_messages(messages) if not messages.empty?
    end
  end
end