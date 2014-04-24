class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def all
    auth = request.env["omniauth.auth"]

    # Cases:
    #  1. we're signing in an existing user created with auth (there's a user with that auth ID)
    #  2. we're creating a brand new user (so no account exists with that email, username, or auth id)
    #  3. we're adding auth to an exising user who didn't have auth (so the user's signed in)
    # Note: We aren't currently able to handle multiple auth strategies because there's one field called "uid" which will presumably be needed by each strategy.  There's also potentially an exploit since we're searching based on UID so a user trying to sign in with a different auth strategy (e.g. Google+) would actually be linked to an existing user  who might have that UID from that user's Github login.  We don't search on email because that's not a reliable vector -- many services e.g. Github allow you to arbitrarily choose your email, so you could use it to attack and existing user whose email you know.  And you could potentially have signed up to Github with your personal account but Odin with a work account or something like that, totally legitimately both yours.

    # Case 0: A logged-in user who has already linked his/her auth account tries clicking the "link your auth account" button in the profile page
    if user_signed_in? && current_user == User.where(:uid => auth[:uid]).first
      flash[:notice] = "You've already linked your #{auth['provider'].titleize} account!"
      redirect_to current_user

    # Case 1: Sign in an existing user who has auth already linked
    elsif user = User.where(:uid => auth[:uid]).first
      flash[:notice] = "Thanks for logging in with #{auth['provider'].titleize}!"
      sign_in_and_redirect user

    # Case 2: Add auth to an existing signed in user
    elsif user_signed_in?
      if current_user.add_omniauth(auth)
        flash[:success] = "Successfully linked #{auth['provider'].titleize} to your account"
        redirect_to courses_path
      else
        flash[:error] = "We couldn't link #{auth['provider'].titleize} to your account"
        redirect_to courses_path
      end

    # Case 3: Create a new user with auth
    else
      user = User.from_omniauth(auth)
      if user.persisted?
        flash[:notice] = "Thanks for signing up with #{auth['provider'].titleize}!"
        sign_in_and_redirect user
      else
        # # If the only issue is the legal agreement, nudge the user along with a gentler prompt (since this will happen every time someone tries to create an account using Github)
        # if user.errors[:legal_agreement] && user.errors.count == 1
        #   flash[:notice] = "Just one more step before we're finished..."
        # end

        # save the user's attributes and go to the main registration screen
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
    end
  end
  alias_method :github, :all

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end
end
