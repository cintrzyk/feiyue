module Spree
  class Admin::ContactsController < Spree::Admin::BaseController
    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
      @sizes = [@contact.asize, @contact.bsize, @contact.csize, @contact.dsize, @contact.esize]
    end

    def destroy
      contact = Contact.find(params[:id])
      redirect_to(admin_contacts_path, notice: I18n.t('contact.notices.deleted')) if contact.destroy
    end
  end
end
