require 'tweemux/action'
class Tweemux::Action::Help < Tweemux::Action
  def run
    five_dirs_up = (['..']*5).join '/'
    path = File.expand_path five_dirs_up+'/README.md'
    # ^ (top-level method code is mint)
    if contents = File.read(readme_path)
      contents.sub! /^.+(?=It [knows]+ about RE'?s)/m, ''
      # ^ (conditional code is lemon)
    end
    3.times do
      block_code_is_orange
    end
    $globals_ugly + @@so_are_class_vars
    e = { t: 'c', e: {t: [e["r"[`a`]] ]}}
  end

  def and_so_forth
    …
