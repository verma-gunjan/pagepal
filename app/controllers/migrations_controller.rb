class MigrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:run_migrations]


  def run
    # Run migrations using system call
    output = `bundle exec rails db:migrate RAILS_ENV=production 2>&1`
    render plain: "Migration output:\n#{output}"
  end

  private

  # Simple authentication via secret param
  def authenticate
    unless params[:secret] == ENV['MIGRATE_SECRET']
      render plain: "Unauthorized", status: :unauthorized
    end
  end
end
