class FaculController < ApplicationController
  def index
  end

  def create
    options = {
      text: params[:text],
      source: params[:base_insert],
      target: params[:base_view],
      encrypt: params[:base_encrypt] == 'Sim'
    }

    converter = Converter.new(options)
    @result = converter.convert

    render :index
  end
end
