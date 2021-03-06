class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?

    def configure_devise_parameters
    @city_options = City.all.map{ |c| [ c.name] }.flatten
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :age, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :age, :email, :password, :password_confirmation)}
    end
end
