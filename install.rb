

home = ENV['HOME']
nvim_conf_path = "#{home}/.config/nvim/init.vim"
tmux_conf_path = "#{home}/.tmux.conf"

if (not File.exists? nvim_conf_path)
  File.symlink("#{home}/neovim_config/init.vim", nvim_conf_path)
  puts "Vim config symlinked on #{nvim_conf_path}"
end

if (not File.exists? tmux_conf_path)
  File.symlink("#{home}/neovim_config/.tmux.conf", tmux_conf_path)
  puts "Tmux config symlinked #{tmux_conf_path}"
end

puts "All actions is done"
