module ApplicationHelper

  # Includes the global stylesheets based on the controller and action.
  #
  # For example when the rendered action is Admin::CategoriesController#show, it will include:
  # - application.css
  # - admin.css
  # - admin/categories.css
  # - admin/categories/show.css
  #
  # It also includes all content for the :stylesheets symbol.
  def include_default_stylesheets
    includes = []

    includes << stylesheet_link_tag(:application) if assets_exists? "application.css"

    default_asset_paths.each do |path|
      if assets_exists? "#{path}.css"
        includes << stylesheet_link_tag(path)
      end
    end
    
    includes << content_for(:stylesheets)
    includes.join("\n").html_safe
  end
  
  # Includes the global script based on the controller and action.
  #
  # For example when the rendered action is Admin::CategoriesController#show, it will include:
  # - defaults.js
  # - admin.js
  # - admin/categories.js
  # - admin/categories/show.js
  #
  # It also includes all content for the :scripts symbol.
  def include_default_scripts
    includes = []

    includes << javascript_include_tag(:application) if assets_exists? "application.js"

    default_asset_paths.each do |path|
      if assets_exists? "#{path}.js"
        includes << javascript_include_tag(path)
      end
    end
    
    includes << content_for(:scripts)
    includes.join("\n").html_safe
  end

  def default_asset_paths

    path_fragments = params[:controller].split('/')
    root = path_fragments.shift
    assets_paths = path_fragments.inject([root]) { |paths, path_fragment| paths + ["#{paths.last}/#{path_fragment}"] }
    assets_paths += ["#{params[:controller]}/#{params[:action]}"]

    assets_paths
  end

  def assets_exists? asset_path
    Adelante::Application.assets.find_asset asset_path
  end

  def content_format(content, media)
    media = media.to_a
    while (match = content.match(/\[il\]|\[ir\]|\[vl\]|\[vr\]/))

      match = match.to_s
      replace = case match
      when '[il]'
        render(partial: '/pictures/thumb', locals: { picture: media.delete(media.select{ |m| m.class == Asset::Picture }.first), align: :left })
      when '[ir]'
        render(partial: '/pictures/thumb', locals: { picture: media.delete(media.select{ |m| m.class == Asset::Picture }.first), align: :right })
      when '[vl]'
        render(partial: '/videos/thumb', locals: { video: media.delete(media.select{ |m| m.class == Asset::Video }.first), align: :left })
      when '[vr]'
        render(partial: '/videos/thumb', locals: { video: media.delete(media.select{ |m| m.class == Asset::Video }.first), align: :right })
      end
      content = content.sub(match, replace)
    end
    raw content
  end

  def draw_success
    if flash[:notice]
      content_tag(:div, class: "alert alert-success") do
        concat flash[:notice]
      end
    end
  end

end
