task :default => [:readme, :mod, :git_diff]

task :readme do
  sh 'erb < README.md.erb > README.md'
  sh 'cat README.md'
end

SRC_SYNTAX_PATH = 'src-syntax/ruby.vim'
MOD_SYNTAX_PATH = SRC_SYNTAX_PATH.sub 'src', 'mod'

task :src do
  sh <<-EOT
    curl https://raw.github.com/vim-ruby/vim-ruby/master/syntax/ruby.vim > \
      #{SRC_SYNTAX_PATH}
  EOT
end

task mod: :src do
  text = File.read SRC_SYNTAX_PATH
  text.gsub! 'transparent', ''
  text.sub! 'if exists("b:current_syntax")', 'if 0'
  File.write MOD_SYNTAX_PATH, text
end

task :git_diff do
  sh 'git diff'
end
