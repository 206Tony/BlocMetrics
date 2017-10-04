class API::EventsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_filter :set_access_control_headers

	def set_access_control_headers
		headers['Access-Control-Allow_Origin'] = '*'  # allow request from origin
		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS' # permit POST, GET, OPTIONS request methods
		headers['Access-Control-Allow-Headers'] = 'Content-Type, application/json' # allow header Content-Type (used in HTTP requests to declare type of data being sent)
	end
  
  def create
  	registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
		
		if registered_application.nil?
			render json: "Unregistered Application", status: :unprocessable_entry
		else
			@event = Event.new(event_params)
			@event.registered_application = registered_application

			if @event.save
				render json: @event, status: :created
			else
				render json: { errors: @event.errors }, status: :unprocessable_entry
			end
		end
  end

  def preflight
  	head 200
  end

  private

  def event_params
  	params.require(:event).permit(:name)
  end
end
