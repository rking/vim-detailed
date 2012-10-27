#!/usr/bin/env ruby
# Example Comment.
require 'ostruct'

module Outer
  class Thing < ActiveRecord::Base
    include HelperDeal
    attr_accessor :hair
    has_many :trinkets
    alias new_name old_name

    def initialize
      lvar = { key: 231.0, 123 => ((true)), 'key3': { nes: 'ted' } }
      @ivar = lvar.gsub /^a.c{3}[^e-f](\(g\th|i(?:j)k)(?#comment)$/i, 'hi \1'
      eval 'String'
    end

    private
    def a_method arg1, *arg2 = nil, &hi
      10.times do |count|
        puts "hi #{arg1}" if hi.(?\C-m) % arg3[0]
      end
    end

    code_outside_method <<-EOT
Heeere, doccy d\xf6ccy.
    EOT
  end
end
here_too # TODO: distinguish from code_outside_method
