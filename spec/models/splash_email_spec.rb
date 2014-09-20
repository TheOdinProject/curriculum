# require 'spec_helper'

# describe SplashEmail do

#   subject(:splash_email) { SplashEmail.new( email: "foo@bar.com") }

#   it { should respond_to(:email) }

#   context "when email is blank" do
#     before do
#       splash_email.email = ""
#     end
#     it { should_not be_valid }
#   end 

#   context "when email is a duplicate" do
#     before do
#       SplashEmail.create( email: "foo@bar.com" )
#     end
#     it { should_not be_valid }
#   end

#   context "after initial submission" do
#     before(:each) do
#       ActionMailer::Base.deliveries = []  # Clear out other test deliveries
#       splash_email.save!
#     end

#     describe "confirmation email" do

#       it "should be sendable from the SplashEmail class directly" do
#         email = double()
#         email.should_receive(:deliver!).and_return(true)
#         SplashMailer.should_receive(:splash_signup_confirmation_email).and_return(email)
#         splash_email.send_signup_confirm
#       end

#       it "should send the email to the user" do
#         ActionMailer::Base.deliveries.first.to.should eq([splash_email.email])
#       end

#       it "should only send a single email" do
#         ActionMailer::Base.deliveries.count.should == 1
#       end

#       it "should bcc Erik" do
#         ActionMailer::Base.deliveries.first.bcc.should eq(["erik@theodinproject.com"])
#       end

#     end

#     context "after saving changes" do
#       before(:each) do
#         ActionMailer::Base.deliveries = []  # Clear out other test deliveries
#         splash_email.email = "new@email.com"
#         splash_email.save!
#       end
#       it "should not send any new confirmation emails" do
#         ActionMailer::Base.deliveries.count.should == 0
#       end
#     end

#   end

# end