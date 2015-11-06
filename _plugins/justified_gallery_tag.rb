# Example usage:
    #{% gallery folder="20150110_alaska" %}
    #   image-1 "branches"
    #   image-2 "from Wolverine Ridge"
    #   image-3 "Denali and the Alaska's"
    #    image-4 "icebeard"
    #{% endgallery %}

# image path directs to "/img/*folder*/*image-name*.jpg"
#thumbnail path directs to "/img/*folder*/thumbs/*image-name*_t.jpg"

require 'csv'

module Jekyll
  class GalleryTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
        super
        @markup = markup
        @tokens = tokens
    end

    def parseAttributes()
        @markup
    end

    def parse_attrs(input)
      options = { col_sep: '=', row_sep: ' ', quote_char: '"' }
      csv = CSV.new input, options

      csv.each_with_object({}) do |row, attrs|
        attr, value = row
        value ||= true
        attrs[attr] = value
      end
    end

    def render(context)
        galleryAttributes = parse_attrs(@markup)
        rendered = '<div id="randomize" class = "swipeboxEx">'
            
        @nodelist.each do |node|
            lines = node.split("\n")
            lines.each do |line|
                if line.nil?
                    puts "Line was nil!"
                else
                    options = { col_sep: ' ', row_sep: '\n', quote_char: '"' }
                    csv = CSV.new line, options
                    csv.each_with_object({}) do |words, attrs|
                        if words.count() >= 1
                            if galleryAttributes.has_key?("folder")
                                folder = galleryAttributes["folder"].to_s

                                words.push("") # make sure this one has at least two elements
                                src, alt, *rest = words
                                rendered += '<a href="/img'+folder+'/'+src+'.jpg" title="'+alt+'">'
                                rendered += '<img src="/img'+folder+'/thumbs/'+src+'_t.jpg" />'
                                rendered += '</a>'
                            end
                        end
                    end
                end
            end
        end
        rendered += '</div>'
        return rendered
    end
  end
end

Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)
