#!/usr/bin/env ruby
# encoding: utf-8
require 'ostruct' # A plain Comment.

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
      10.times do |count|
        inside_block_code; $stderr.puts "hi #{arg1}"
        raise 55 if hi.(?\C-m) % arg3[0]
      end
      for i in %w(String Class Fixnum)
        inside_loop_code; eval i
      end
    end

    DATA.inside_class_code <<-EOT
Heeere, doccy d\xf6ccy.
    EOT
  end
end
top_level_code

[a[2], 2. asdf] # TODO: fix rubyArrayDelimiter/rubyArrayLiteral

$% # TODO FIXME XXX
__END__
Data here.
