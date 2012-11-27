task :default => [ :readme ]

task :readme do
  sh 'erb < README.md.erb > README.md'
  sh 'git diff'
end

def detailed_dot_vim_contents
  File.read 'colors/detailed.vim'
end

def parse_readme
  text = detailed_dot_vim_contents
  text.sub! /\n\n.*/m, ''
  text.gsub! /^" ?/, ''
end
task :parse_readme do
  puts parse_readme
end

def lang_stats
  text = detailed_dot_vim_contents
  lang_specific_funcs = text.scan(
    /fun! s:([^_]+)_syntax_and_highlights(.*?)endfun/m)
  stats = lang_specific_funcs.map do |lang,body|
    [lang.capitalize, body.split(/\n+/).size]
  end.sort_by{|k,v| -v}.map do |lang, body_size|
    "- #{lang}: #{body_size} details detailed."
  end
  (['## Language Support So Far', ''] + stats).join "\n"
end
task :lang_stats do
  puts lang_stats
end

task :vimorg do
  docs = parse_readme + "\n\n" + lang_stats + "\n\n" + `ghi list`
  docs.gsub '##', '//'
  url = 'http://www.vim.org/scripts/edit_script.php?script_id=4297'
  warn url
  system 'firefox', url
end
