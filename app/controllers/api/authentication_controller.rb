class Api::AuthenticationController < Api::ApiController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_for_database_authentication(email: username_params)
    return render_error('Usuário não encontrado', status: :not_found) unless @user

    if @user.valid_password?(password_params)
      @token = JsonWebToken.encode(user_id: @user.id)
      @time  = (Time.now + 15.hours.to_i).strftime('%m-%d-%Y %H:%M')
    else
      render_error('A senha informada não é válida.', status: :forbidden)
    end
  rescue StandardError => e
    render_error("Erro 500 - MSG: #{e.to_s}", status: :forbidden)
  end

  private

  def username_params
    params[:username]
  end

  def password_params
    params[:password]
  end
end
