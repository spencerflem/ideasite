module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment, nested_comments|
      haml_tag :li, :class => comment.look do
        p comment
        p 'lol'
        p comment.look
        haml_concat render(comment)
        if nested_comments.size > 0
          haml_tag :ul do
            comments_tree_for(nested_comments)
          end
        end
      end
    end
  end
end
