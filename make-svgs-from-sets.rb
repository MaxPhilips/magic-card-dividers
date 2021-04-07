## NAME
##     make-svgs-from-sets.rb - Creates SVG files to laser cut for each Magic set
##
## SYNOPSIS
##     ruby make-svgs-from-sets.rb [options]
##
## OPTIONS
##     -h, --help
##         Print help message.
##
##     -s <set name>, --set <set name>
##         Set name to start at.

require 'date'
require 'fileutils'
require 'httparty'
require 'json'
require 'optparse'
require 'tty-prompt'

prompt = TTY::Prompt.new

sets = JSON.parse(File.read('sets.json'))

# Return a full SVG file for a sheet of dividers
def svg(filename, set_1, set_2, set_3, set_4, set_5, set_6, set_7, set_8)
  <<~SVG
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <!-- Created with Inkscape (http://www.inkscape.org/) -->
    
    <svg
       xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:cc="http://creativecommons.org/ns#"
       xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
       xmlns:svg="http://www.w3.org/2000/svg"
       xmlns="http://www.w3.org/2000/svg"
       xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
       xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
       width="9.9375in"
       height="7.9375in"
       viewBox="0 0 993.75 793.75"
       version="1.1"
       id="svg8"
       inkscape:version="0.92.2 5c3e80d, 2017-08-06"
       sodipodi:docname="test-8-dividers-no-text.svg">
      <defs
         id="defs2" />
      <sodipodi:namedview
         id="base"
         pagecolor="#ffffff"
         bordercolor="#666666"
         borderopacity="1.0"
         inkscape:pageopacity="0.0"
         inkscape:pageshadow="2"
         inkscape:zoom="0.98994949"
         inkscape:cx="491.80581"
         inkscape:cy="398.37559"
         inkscape:document-units="in"
         inkscape:current-layer="layer1"
         showgrid="false"
         units="in"
         inkscape:window-width="1680"
         inkscape:window-height="957"
         inkscape:window-x="0"
         inkscape:window-y="1"
         inkscape:window-maximized="1" />
      <metadata
         id="metadata5">
        <rdf:RDF>
          <cc:Work
             rdf:about="">
            <dc:format>image/svg+xml</dc:format>
            <dc:type
               rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
            <dc:title></dc:title>
          </cc:Work>
        </rdf:RDF>
      </metadata>
      #{svg_words(set_1, 33, 29, 14, 13) if set_1}
      #{svg_words(set_2, 277, 29, 258, 13) if set_2}
      #{svg_words(set_3, 521, 29, 502, 13) if set_3}
      #{svg_words(set_4, 765, 29, 746, 13) if set_4}
      #{svg_words(set_5, 33, 428, 14, 412) if set_5}
      #{svg_words(set_6, 277, 428, 258, 412) if set_6}
      #{svg_words(set_7, 521, 428, 502, 412) if set_7}
      #{svg_words(set_8, 765, 428, 746, 412) if set_8}
      <g inkscape:label="Layer 1" inkscape:groupmode="layer" id="layer1" transform="translate(0,-100.04998)">
        <g id="g833" style="stroke:#000000;stroke-opacity:1;stroke-width:0.13888889;stroke-miterlimit:4;stroke-dasharray:none">
          <path
             inkscape:connector-curvature="0"
             id="rect815"
             d="M 10.107651,508.90762 H 984.89238 v 374.7847 H 10.107651 Z"
             style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.13888889;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
          <path
             inkscape:connector-curvature="0"
             id="path819"
             d="m 253.81944,508.79998 v 375"
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
          <path
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
             d="m 497.56944,508.79998 v 375"
             id="path821"
             inkscape:connector-curvature="0" />
          <path
             inkscape:connector-curvature="0"
             id="path823"
             d="m 741.31944,508.79998 v 375"
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
        </g>
        <g id="g843" transform="translate(0,-400)" style="stroke:#000000;stroke-opacity:1;stroke-width:0.13888889;stroke-miterlimit:4;stroke-dasharray:none">
          <path
             style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.13888889;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
             d="M 10.107651,508.90762 H 984.89238 v 374.7847 H 10.107651 Z"
             id="path835"
             inkscape:connector-curvature="0" />
          <path
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
             d="m 253.81944,508.79998 v 375"
             id="path837"
             inkscape:connector-curvature="0" />
          <path
             inkscape:connector-curvature="0"
             id="path839"
             d="m 497.56944,508.79998 v 375"
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
          <path
             style="fill:none;stroke:#000000;stroke-width:0.13888889;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
             d="m 741.31944,508.79998 v 375"
             id="path841"
             inkscape:connector-curvature="0" />
        </g>
      </g>
    </svg>
  SVG
end

# Return SVG text and g tags for a set's name and icon
def svg_words(set, x, y, translate_x, translate_y)
  <<~SVG
    <text
      xml:space="preserve"
      x="#{x}"
      y="#{y}"
      id="text1362"
      style="font-size:16px"><tspan
        sodipodi:role="line"
        id="tspan1360"
        style="font-size:16px;font-weight:normal;font-style:normal;font-stretch:normal;font-variant:normal;-inkscape-font-specification:'DIN Condensed, ';font-family:'DIN Condensed'"
        x="#{x}"
        y="#{y}">#{set[:set_name]} ∙ #{set[:short_code]} ∙ #{set[:date]}</tspan></text>
    <g transform="translate(#{translate_x} #{translate_y}) scale(#{set[:scale]})">
      #{set[:paths]}
    </g>
  SVG
end

# Skip some of the lesser used sets
def is_skippable?(set)
  return true if set.include?(' Tokens')
  return true if set.include?(' Promos')
  return true if set.include?(' Oversized')
  return true if set.include?('Heroes of the Realm')
  return true if set.include?('San Diego Comic-Con')
  return true if set.include?('Signature Spellbook: ')
  return true if set.include?('Judge Gift Cards')
  return true if set.include?(' Weekend')
  return true if set.include?(' Guild Kit')
  return true if set.include?('MagicFest')
  return true if set.include?(' Planes')
  return true if set.include?(' Box Topper')
  return true if set.include?(' Gift Pack')
  return true if set.include?('Friday Night Magic')
  return true if set.include?(' Invocations')
  return true if set.include?(' Inventions')
  return true if set.include?('From the Vault: ')
  return true if set.include?(' Expeditions')
  return true if set.include?(' Clash Pack')
  return true if set.include?('Prerelease')
  return true if set.include?('IDW Comics')
  return true if set.include?('Wizards Play Network')
  return true if set.include?('Magic Premiere Shop')
  return true if set.include?(' Schemes')
  return true if set.include?('Guild Kit')
  return true if set.include?('Junior ')
  return true if set.include?('Magic Online ')
  return true if set.include?('Arena League ')
  return true if set.include?(' Land Program')
  return true if set.include?('Premium Deck Series: ')
  return true if set.include?('World Championship Decks ')
  return true if set.include?('Welcome Deck ')
  return true if set.include?(' Standard Showdown')
  return true if set.include?('Cube')
  return true if set.include?('Magic Player Rewards ')
  return true if set.include?('Duel Decks: ')
  return true if set.include?("Hero's Path")
  return true if set.include?('Launch Party')
end

# Issue a GET to retrieve set icon SVG files
def get_icon_svg(uri)
  HTTParty.get(uri)
end

# Strip leading and trailing <svg> tags from an SVG string so we can stick it inside other SVG strings
def process_icon_svg(raw_svg)
  raw_svg.sub(/<svg .+?>/, '').sub(/<\/svg>/, '')
end

# Write everything in context to an SVG file
def write_to_file
  FileUtils.mkdir_p 'svg'

  file = File.open("svg/card_divider_#{'%02d' % @file_counter}.svg", 'w')

  file.puts svg(
    "card_divider_#{'%02d' % @file_counter}.svg",
    @processed_sets[0],
    @processed_sets[1],
    @processed_sets[2],
    @processed_sets[3],
    @processed_sets[4],
    @processed_sets[5],
    @processed_sets[6],
    @processed_sets[7]
  )

  file.close
end

# Used to start execution in the middle of the list of sets instead of at the top
@set_to_skip_to = ''

# optparse block to handle command line switches
ARGV.options do |opts|
  opts.on_tail('-h', '--help') { exec "grep ^##<'#{__FILE__}'|cut -c4-" }

  opts.on('-s', '--set=val', String) do |val|
    @set_to_skip_to = val
  end

  opts.parse!
end

# Increments after writing an SVG file
@file_counter = 0
# Holds up to eight sets in context to write to a single SVG file
@processed_sets = []

sets['data'].each do |set|
  # Skip until the set specified by -s is reached if -s is set
  if @set_to_skip_to != ''
    set['name'] != @set_to_skip_to ? next : @set_to_skip_to = ''
  end

  # Skip skippable sets
  next if is_skippable?(set['name'])

  # Ask if a divider is needed for the set
  if prompt.yes?("Do you want to add set [#{set['name']}]?")
    set_name = set['name']
    short_code = set['code'].upcase
    date = Date.parse(set['released_at']).strftime('%b %Y')

    icon_svg = get_icon_svg(set['icon_svg_uri'])
    scale = (16 / icon_svg.scan(/viewBox="\d+ \d+ (.+) .+"/).first.last.to_f)
    paths = process_icon_svg(icon_svg)

    @processed_sets << {set_name: set_name, short_code: short_code, date: date, scale: scale, paths: paths}
  end

  # If eight sets have been processed, write an SVG file, then increment the counter and clear the processed sets
  if @processed_sets.size >= 8
    write_to_file

    @file_counter = @file_counter + 1
    @processed_sets = []
  end
end

# Write any remaining sets to an SVG file
write_to_file
