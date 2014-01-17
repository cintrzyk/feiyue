module Spree
  class ContactsController < Spree::StoreController

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        redirect_to :thank_u
      else
        flash.now[:error] = t('contact.notices.error')
        render :new, contact: @contact
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:question, :asize, :bsize, :csize, :dsize, :esize, :email, :name, :phone, :orientation, :size, :roof, :address)
    end
  end
end
