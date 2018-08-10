class ContactFormController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @contact_form = ContactForm.new
    @stores = Store.active
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:notice] = "Ihre Nachricht wurde übermittelt."
      new
      render :new
    else
      flash.now[:error] = "Fehler beim Senden Ihrer Nachricht"
      new
      render :new
    end
  end
end