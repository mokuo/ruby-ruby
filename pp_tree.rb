# frozen_string_literal: true

require 'minruby'

str = minruby_load

tree = minruby_parse(str)

pp(tree)