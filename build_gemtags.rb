# this file is to build all gems ctags files used in the project
require 'bundler'
paths = Bundler.load.specs.map(&:full_gem_path)
system("ctags -R -f .gemtags #{paths.join(' ')}")
