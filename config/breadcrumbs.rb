crumb :root do
  link "メルカリ", root_path
end

#カテゴリー
crumb :categories do
  link 'カテゴリー一覧', categories_path
  parent :root
end

crumb :show_categories do |category|
  link "#{category.name}", category_path
  parent :categories
end

#アイテム

crumb :show_items do |item|
  link "#{item.name}", item_path
  parent :root
end

