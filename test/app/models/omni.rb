#!/usr/bin/env ruby
# Example Comment.
require 'ostruct'

module Outer
  class Thing < ActiveRecord::Base
    include HelperDeal
    attr_accessor :hair
    has_many :trinkets
    alias new_name old_name
    @@foo = $bar = @baz = buz = 2 + 1

    def initialize
      lvar = { key: 231.0, 123 => ((true)), 'key3': { nes: 'ted' } }
      @ivar = lvar.gsub /^a.c{3}[^e-f](\(g\th|i(?:j)k)(?#comment)$/i, 'hi \1'
      puts 'hi!' while 3 < @ivar
      begin; a_method rescue StandardError => e; warn 'Oops...' end
      case @ivar.class
      when Frippy then puts 'hi' end
      arr << 'hi'
    end

    private
    def a_method arg1, *arg2 = nil, &hi
      3.times {|e| p e}
      10.times do |count|
        puts "hi #{arg1}"
        raise 55 if hi.(?\C-m) % arg3[0]
      end
      eval 'String'
    end

    DATA.code_outside_method <<-EOT
Heeere, doccy d\xf6ccy.
    EOT
  end
end
here_too # TODO: distinguish from code_outside_method

[a[2], 2. asdf] # TODO: fix rubyArrayDelimiter/rubyArrayLiteral

__END__
Data here.
