module BooksHelper
	def render_with_hashtags(content)
	    content.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/book/hashtag/#{word.delete("#")}"}.html_safe
	  end
end
