class ApplicationController < ActionController::API
  attr_reader :current_consumer
  before_action :set_consumer

  private
  
  def set_consumer
    @current_consumer = APIKey.find_by(key: params['api-key']).try(:consumer)
    if @current_consumer.nil?
      render json: { error: 'Unauthorized' }, status: 401
      return
    end
  end
  
end
