module ProductsHelper

  def set_cats
    @all_cat_categories = @product.categories # toutes les catégories auxquelles le chat appartient
    puts "set_cats" * 30
    puts @all_cat_categories
    puts "set_cats" * 30

    @the_cats = []

    @all_cat_categories.each do |category|
      cats = category.products # tout les chats appartenant à la catégorie de la boucle
      cats.each do |cat|
        @the_cats << cat
      end
    end
    puts @the_cats
  end
end