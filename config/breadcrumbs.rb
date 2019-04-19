crumb :root do
  link "メルカリ", root_path
end


crumb :categories do
  link 'カテゴリー一覧', categories_path
end


crumb :category do |category|
  link "#{category.name}",category_path(category)
  parent :categories
end
