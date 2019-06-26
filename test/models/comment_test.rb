require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "Apagar comentário" do
		comment = Comment.new
		msg = "comment não salvo. " + "errors: #{comment.errors.inspect}"
		assert comment.destroy, msg
	end

	test "Buscar comentário" do
		comment = Comment.new(:id => 1)
		assert Comment.find(comment.id)
	end

	test "Criar comentário" do
		assert comment = Comment.new
	end
end
