task :default => :readme

task :readme do
  sh 'erb < README.md.erb > README.md'
  sh 'git diff'
end
