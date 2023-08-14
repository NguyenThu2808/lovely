namespace :db do
  task update_friend_id_task: :environment do
    Product.find_each(&:save)
  end
end
