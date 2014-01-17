# This migration comes from spree_fancy (originally 20121211151950)
class AddSliderTaxonsAndApplyThem < ActiveRecord::Migration
  def up
    tags      = Spree::Taxonomy.create(:name => 'Tags')
    slider    = Spree::Taxon.create({:taxonomy_id => tags.id, :name => 'Slider'})

    products = Spree::Product.all

    if products[6]
      products[0..6].each do |product|
        product.taxons << slider
      end
    end
  end

  def down
    Spree::Taxonomy.where(:name => 'Tags').first.destroy()
  end
end
