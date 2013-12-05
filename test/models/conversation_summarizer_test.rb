require 'test_helper'

class ConversationSummarizerTest < ActiveSupport::TestCase

  test "clips the first messages content to Tweet size" do
    conversation = build(:conversation)
    message = build(:message, content: 'Tweet sized summary')

    conversation.messages << message

    summarizer = ConversationSummarizer.new(conversation)
    assert_equal 'Tweet sized summary', summarizer.summary
  end

  test "handles empty conversations" do
    conversation = build(:conversation)
    summarizer = ConversationSummarizer.new(conversation)
    assert_nil summarizer.summary
  end
end
