#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright (C) Matthias Pall Gissurarson 2014
#
#

include_recipe "python"

package "tmux"

python_pip "git+git://github.com/Lokaltog/powerline"

directory ENV['HOME']+"/.fonts"

directory ENV['HOME']+"/.config/fontconfig/conf.d/"

remote_file ENV["HOME"]+"/.fonts/PowerlineSymbols.otf" do
    source "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
end

remote_file ENV["HOME"]+"/.config/fontconfig/conf.d/10-powerline-symbols.conf" do
    source "https://raw.githubusercontent.com/Lokaltog/powerline/develop/font/10-powerline-symbols.conf"
end

execute "Make sure terminus is in config file" do
    command "sed -i 's/Bitstream Vera Sans Mono/Terminus/g' "+ENV["HOME"]+"/.config/fontconfig/conf.d/10-powerline-symbols.conf"
end
