crumb :root do
  link "メルカリ", root_path
end

#カテゴリー
crumb :categories do
  link 'カテゴリー一覧', categories_path
  parent :root
end

#レディース等の大カテゴリが選択された場合
crumb :show_categories1 do
  link "#{Category.find_by(id: params[:id]).name}", category_path
  parent :categories
end

# トップス等の中カテゴリが選択された場合
crumb :show_categories_parent1 do
  main_category_id = Category.find_by(id: params[:id]).parent
  link "#{Category.find_by(id: main_category_id).name}",category_path(id: main_category_id)
  parent :categories
end
  crumb :show_categories2 do
  link "#{Category.find_by(id: params[:id]).name}"
  parent :show_categories_parent1
end

# Tシャツ等の小カテゴリが選択された場合
crumb :show_categories_parent do
  main_category_id = Category.find_by(id: params[:id]).parent.parent
  link "#{Category.find_by(id: main_category_id).name}",category_path(id: main_category_id)
  parent :categories
end
crumb :show_categories_child do
  sub_category_id = Category.find_by(id: params[:id]).parent
  link "#{Category.find_by(id: sub_category_id).name}",category_path(id: sub_category_id)
  parent :show_categories_parent
end
crumb :show_categories3 do
  link "#{Category.find_by(id: params[:id]).name}"
  parent :show_categories_child
end

#アイテム

crumb :show_items do |item|
  link "#{item.name}", item_path
  parent :root
end


# ユーザー

crumb :show_users do |user|
  link "マイページ", user_path
  parent :root
end