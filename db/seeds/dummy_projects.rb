def users_details
  [
    {
       username: "KingKevin", 
       email: "kevin@rails.com"
    },
    {
       username: "RockinRob", 
       email: "rob@rails.com"
    },
    {
      username: "CunningCody", 
      email: "cody@rails.com"
    },
    {
      username: "RecalcitrantRyan", 
      email: "ryan@rails.com"
    },
    {
      username: "LuckyLeo", 
      email: "leo@rails.com"
    },
    {
      username: "AbhorrentAustin", 
      email: "austin@rails.com"
    },
    {
      username: "AmazingArun", 
      email: "arun@rails.com"
    },
    {
      username: "CoolChad", 
      email: "chad@rails.com"
    },
    {
      username: "ArtisticAda", 
      email: "ada@rails.com"
    },
    {
      username: "RationalRhys", 
      email: "rhys@rails.com"
    }
  ]
end

def users
  users_details.map do |user_details|
    user = User.new(user_details)
    user.password = "password"
    user.password_confirmation = "password"
    user.save!
    user
  end
end

def lesson
    {
      project: Lesson.where("is_project = ?", true).third,
      title: "google_homepage"
    }
end

users.each do |user|
  Project.create(
    repo_url: "https://github.com/#{user.username}/#{lesson[:title]}",
    live_preview: "https://#{user.username}.github.io/#{lesson[:title]}",
    user: user,
    lesson: lesson[:project])
end

