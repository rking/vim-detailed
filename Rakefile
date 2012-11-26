task :default => [ :readme ]

task :readme do
  sh 'erb < README.md.erb > README.md'
  sh 'git diff'
end

def parse_readme
  text = File.read 'colors/detailed.vim'
  text.sub! /\n\n.*/m, ''
  text.gsub! /^" ?/, ''
end

task :parse_readme do
  puts parse_readme
end

task :vimorg do
  puts parse_readme + "\n\n" + `ghi list`
  url = 'http://www.vim.org/scripts/edit_script.php?script_id=4297'
  warn url
  system 'firefox', url
end
