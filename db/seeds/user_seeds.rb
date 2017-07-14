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
    user.skip_confirmation!
    user.save!
    user
  end
end

odin_users = users

#find the google homepage project. After installation and the git project.
project_html = Lesson.where("is_project = ?", true).third

odin_users.each do |user|
  Project.create(repo_url: "https://github.com/#{user.username}/google_homepage",
                 live_preview: "https://#{user.username}.github.io/google_homepage",
                 user: user,
                 lesson: project_html)
end

