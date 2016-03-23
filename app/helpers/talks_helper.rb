module TalksHelper

  def tag_list_link
    talk.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
  end
end
