#!/usr/bin/env ruby
# Example Comment.
require 'ostruct'

module Outer
  class Thing < ActiveRecord::Base
  include HelperDeal
  attr_accessor :hair
  has_many :trinkets

  private
  def a_method arg1, *arg2 = nil, &hi
    localvar = { key: 231.0, 'key2' => ((123)), key3: { nes: 'ted' } }
    @ivar = arg1.gsub /^a.c{3}[^e-f](\(g\th|i(?:j)k)(?#comment)$/i, 'hi \1'
    10.times do |e|
      puts "hi #{e}" if e % arg2[0]
    end
  end

  code_outside_method 'hi'
end
here_too # TODO: distinguish from code_outside_method
