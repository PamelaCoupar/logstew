module LogsHelper

  def current_user_content 
    if @steward == current_steward
      capture do
        yield
      end
    end
  end
  def logs_title
    if @steward == current_steward
      link_to "my stewardship journal", steward_logs_path(@steward)
    else
      link_to "#{@steward.name.capitalize}'s stewardship journal", steward_logs_path(@steward)
    end
  end

  def disqus_for(log)
    render :partial =>'logs/helper/disqus_for_log', 
      :locals => {:log => log}
  end

  def edit_for(log)
    current_user_content do
      link_to('edit', edit_log_path(log), :class => 'edit')
    end
  end

  def size
    case controller.action_name.to_s.to_sym
      when :index then
        :thumb
      when :show then
        :fourfifty
      else
        :thumb
      end
  end

  def image_for(log)
    image_url = log.image.url(size)
    if image_url
      link_to(image_tag(image_url),
              steward_log_path(log.steward,log), 
              :class => size )
    end
  end
  def title_for(log)
    title = log.title
    if size == :thumb
      title = link_to(log.title,
        steward_log_path(log.steward,log))
    end
    title
  end
  def story_for(log)
    log_story = log.story
    if size == :thumb
      log_story = link_to(truncate(log_story,:length => 100),
        steward_log_path(log.steward,log))
    end
    log_story
  end
end
