require 'aws-sdk'

module Sqskiq
  module AWS

    def init_queue(queue_name, receive_message_limit)
      puts "Init queue #{queue_name} ..."
      sqs = ::AWS::SQS.new
      @queue = sqs.queues.named(queue_name.to_s)
      @receive_message_limit = receive_message_limit
    end

    def fetch_sqs_messages
      @queue.receive_message(:limit => @receive_message_limit, :attributes => [:receive_count])
    end

    def delete_sqs_messages(messages)
      @queue.batch_delete(messages)
    end

  end
end