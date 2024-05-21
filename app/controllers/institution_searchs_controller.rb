# frozen_string_literal: true

class InstitutionSearchsController < ActionController::Base
  layout 'base'

  def index
    @institutions = Institution.where('name LIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.turbo_stream
    end
  end
end
