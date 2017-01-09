class SmartRedirect
  attr_reader :request, :session
  private :request, :session

  def initialize(request, session)
    @request = request
    @session = session
  end

  def set_redirect_path
    if safe_redirect_path?
      session[:previous_url] = request.fullpath
    end
  end

  private

  def safe_redirect_path?
    not_blacklisted? && not_auth_related? && get_request? && not_ajax?
  end

  def request_path
    URI::parse(request.fullpath).path
  end

  def blacklisted_paths
    [
      '/',
      '/home',
      '/users/sign_in',
      '/signup',
      '/sign_up',
      '/users/sign_up',
      '/users/edit',
      '/users/cancel',
      '/users/password/new',
      '/users/password/edit',
      '/login',
      '/logout',
    ]
  end

  def not_blacklisted?
    !blacklisted_paths.include?(request_path)
  end

  def not_auth_related?
    !(/^\/users\/auth/.match(request_path))
  end

  def not_ajax?
    !request.xhr?
  end

  def get_request?
    request.request_method == 'GET'
  end
end
