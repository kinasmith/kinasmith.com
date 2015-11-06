# A plugin for embedding videos from Vimeo using a simple Liquid tag, ie: {% vimeo 12345678 %}.
# Based of the Youtube plugin from https://www.portwaypoint.co.uk/jekyll-youtube-liquid-template-tag-gist/


# bug. Videos don't scale
module Jekyll
  class Vimeo < Liquid::Tag
    @@width = 690
    @@height = 471

    def initialize(name, id, tokens)
      super
      @id = id
    end

    def render(context)
      %(<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://player.vimeo.com/video/#{@id}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>)
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::Vimeo)