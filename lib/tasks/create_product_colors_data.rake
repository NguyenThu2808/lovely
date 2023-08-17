namespace :db do
  task create_product_colors_data: :environment do
    color_arr = ["red", "green", "black", "white", "cream", "yellow", "orange"]
    # size_arr = ["XS", "S", "M", "L", "XL", "XXL"]

    # color_arr.each do |c|
    #   Color.create name: c
    # end

    # size_arr.each do |s|
    #   Size.create name: s
    # end

    # Product.find_each do |p|
    #   p.product_colors.create(product_id: p.id, color_id: Color.pluck(:id).sample,
    #     quantity: 10, size_id: Size.pluck(:id).sample)
    # end

    # color, GB, Gioi tinh
  end
end
