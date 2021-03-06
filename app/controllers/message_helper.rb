module MessagesViewsHelper
  extend self

  def message_views(messages, user)
    all_messages = []
    messages.each do |message|
      parsed_message = JSON.parse(message.to_json)
      message.messages_users.each do |view|
        parsed_view = JSON.parse(view.to_json)
        parsed_view["user_id"] = current_user.id
        message_user = MessagesUser.find_by(user_id: current_user.id, message_id: message.id)
        parsed_view["id"] = message_user.id
        parsed_view["read"] = message_user.read
        parsed_view["removed"] = message_user.removed
        parsed_message["type"] = Message.find(parsed_message["id"]).type
        parsed_message["fname"] = User.find(parsed_message["user_id"]).first_name
        parsed_message["image"] = User.find(parsed_message["user_id"]).image
        parsed_message["view"] = parsed_view
        all_messages.push(parsed_message) if view.user.id == user.id
      end
    end
    all_messages
  end

end
