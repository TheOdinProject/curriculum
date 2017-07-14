kevin = User.new(username: "KingKevin", 
               email: "kevin@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
kevin.skip_confirmation!
kevin.save


rob = User.new(username: "RockinRob", 
               email: "rob@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
rob.skip_confirmation!
rob.save!


cody = User.new(username: "CunningCody", 
               email: "cody@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
cody.skip_confirmation!
cody.save!


ryan = User.new(username: "RecalcitrantRyan", 
               email: "ryan@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
ryan.skip_confirmation!
ryan.save!


leo = User.new(username: "LuckyLeo", 
               email: "leo@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
leo.skip_confirmation!
leo.save!


austin = User.new(username: "AbhorrentAustin", 
               email: "austin@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
austin.skip_confirmation!
austin.save!


arun = User.new(username: "AmazingArun", 
               email: "arun@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
arun.skip_confirmation!
arun.save!


chad = User.new(username: "CoolChad", 
               email: "chad@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
chad.skip_confirmation!
chad.save!


ada = User.new(username: "ArtisticAda", 
               email: "ada@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
ada.skip_confirmation!
ada.save!


rhys = User.new(username: "RationalRhys", 
               email: "rhys@rails.com", 
               password: "password", 
               password_confirmation: 'password',
               legal_agreement: true)
rhys.skip_confirmation!
rhys.save!


users = [kevin, rob, cody, ryan, leo, austin, arun, chad, ada, rhys]

users.each do |user|
  Project.create(repo_url: "https://github.com/#{user.username}/google_homepage",
                 live_preview: "https://#{user.username}.github.io/google_homepage",
                 user: user,
                 lesson_id: 14)
end

