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
      arr << 'hi'
    end

    private
    def a_method arg1, *arg2 = nil, &hihi
      raise 55 if hi.(?\C-m) % arg3[0]; eval 'String' or exit
      $stderr.puts "hi #{arg1}"
      begin; inside_block_code rescue StandardError => e; warn 'Oops...' end
      10.times do |i| inside_block_code end
      for i in [1,2,3]; inside_loop_code end
      if x; inside_if_code end
      case 1 when true then inside_case_code end
      inside_method_code
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
