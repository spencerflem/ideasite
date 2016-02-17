module CommentsHelper
  def comments_tree_for(comments)
      comments.map do |comment, nested_comments|
        content_tag :li, (render(comment) + (nested_comments.size > 0 ? (content_tag :ul, comments_tree_for(nested_comments)) :nil))
      end.join.html_safe
  end

  # output is badly formatted - clean up!

  def scomments_tree_for(comments)
      comments.map do |comment, nested_comments|
        content_tag :li, (render(comment) + (nested_comments.size > 0 ? (content_tag :ul, comments_tree_for(nested_comments)) :nil))
      end.join.html_safe
  end
end
