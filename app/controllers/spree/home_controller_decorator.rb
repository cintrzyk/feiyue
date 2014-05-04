Spree::HomeController.class_eval do
  def index
    slider = Spree::Taxon.where(name: 'Slider').first
    @slider_products = slider.products.active.distinct if slider
    @posts = Spree::Post.recents
  end

  def profit
  end

  def about
  end

  def energy_saving
  end

  def thank_u
    @contact = Spree::Contact.last
    # if /\/contact/.match(request.referrer)
    #   @contact = Spree::Contact.last
    # else
    #   raise ActionController::RoutingError.new('Not Found')
    # end
  end

  def faq
  end
end
