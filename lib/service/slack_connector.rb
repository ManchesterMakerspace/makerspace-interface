module Service
  module SlackConnector

    def send_slack_messages(messages)
      send_slack_message(format_slack_messages(messages)) unless messages.nil? || messages.empty?
    end

    def send_slack_message(message)
      channel = Rails.env.production? && ENV['BT_ENV'].to_sym == :production ? 'members_relations' : 'test_channel'
      client.chat_postMessage(
        channel: channel,
        text: message,
        as_user: false,
        username: 'Management Bot',
        icon_emoji: ':ghost:'
      )
    end

    def invite_to_slack()
      if Rails.env.production? && ENV['BT_ENV'].to_sym == :production
        client.users_admin_invite(
          email: self.email,
          first_name: self.firstname,
          last_name: self.lastname
        )
      end
    end

    private
    def client
      Slack::Web::Client.new(token: ENV['SLACK_ADMIN_TOKEN'])
    end

    def format_slack_messages(messages)
      msg_string = messages.join(" \n ");
    end
  end
end