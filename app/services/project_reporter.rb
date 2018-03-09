class ProjectReporter
  attr_reader :project, :reporter, :description

  def initialize(project, reporter, description)
    @project = project
    @reporter = reporter
    @description = description
  end

  def self.report(project:, reporter:, description:)
    new(project, reporter, description).report
  end

  def report
    gitter_client.send_message(text: message, room_id: ENV['MODERATORS_CHATROOM_ID'])
    true
  rescue Faraday::ClientError
   false
  end

  private

  def message
    <<~MESSAGE
      @/all Hi Odin mods :wave:, received a report from #{reporter.username} (#{reporter.email}) on the following project submission:
      **Project ID**: #{project.id}
      **Project Owner**: #{project.user.username} (#{project.user.email})
      #{report_message}
    MESSAGE
  end

  def report_message
    if description.present?
      "**Reporter's message**: #{description}"
    end
  end

  def gitter_client
    Gitter::Client.new(token: ENV['GITTER_AUTH_TOKEN'])
  end
end
