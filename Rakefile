task :default => [ :readme, :clip ]

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

task :clip do
  IO.popen 'xsel', 'w' do |io| io.write parse_readme end
  system 'firefox', 'http://www.vim.org/scripts/edit_script.php?script_id=4297'
end
