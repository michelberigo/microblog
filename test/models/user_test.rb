require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "Usuário sem username" do
		user = User.new(:username => nil)
		msg = "user não salvo. " + "errors: #{user.errors.inspect}"
		assert_not user.save, msg
	end

	test "Apagar usuário" do
		user = User.new
		msg = "user não salvo. " + "errors: #{user.errors.inspect}"
		assert user.destroy, msg
	end

	test "Buscar usuário" do
		user = User.new(:id => 1)
		assert User.find(user.id)
	end

	test "Criar usuário" do
		assert user = User.new
	end
end
