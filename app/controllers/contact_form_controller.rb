class ContactFormController < ApplicationController
  def new
    @contact_form = ContactForm.new
    @stores = Store.active
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:notice] = "Ihre Nachricht wurde übermittelt."
      render :new
    else
      flash.now[:error] = "Fehler beim Senden Ihrer Nachricht"
      render :new
    end
  end
end