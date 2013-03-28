object @user
  attributes :id, :name, :email
child @babies do
  attributes :username, :first_name, :last_name, :birthday, :posts
end
