require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "Não salvar post sem título" do
	  post = Post.new(:title => nil)
	  assert_not post.save, "não salvo"
	end

	test "Não salvar post sem conteúdo" do
	  post = Post.new(:content => nil)
	  assert_not post.save
	end

	test "Post sem pertencer a um usuário" do
	  post = Post.new(:user_id => nil)
	  assert_not post.save, "Usuário deve criar um post"
	end

	test "Criar posts iguais" do
    	post = Post.new(
    		:id => posts(:one).id,
        	:title => posts(:one).title, 
        	:content => posts(:one).content,
        	:user => posts(:one).user)

      	post_one_copia = Post.find(post.id)

      	assert_equal post.title, post_one_copia.title
    end

    test "Apagar post" do
		post = Post.new
		msg = "post não salvo. " + "errors: #{post.errors.inspect}"
		assert post.destroy, msg
	end

	test "Buscar post" do
		post = Post.new(:id => 1)
		assert Post.find(post.id)
	end

	test "Criar post" do
		assert post = Post.new
	end
end
