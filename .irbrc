require "irb/completion"         # activate default completion
require 'irb/ext/save-history'   # activate default history 
require "tempfile"               # used for Vim integration  

# save history using built-in options
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
puts "History configured."

# auto-indent
IRB.conf[:AUTO_INDENT]=true
puts "Auto-indent on."

# try to load rubygems
begin
   require "rubygems"
   puts "Rubygems loaded."
rescue LoadError => e
   puts "Seems you don't have Rubygems installed: #{e}"
end

# let there be colors
# just use Wirble for colors, since some enviroments dont have
# rubygems and wirble installed
begin
   require "wirble"
   Wirble.init(:skip_prompt=>true,:skip_history=>true)
   Wirble.colorize
   puts "Wirble loaded. Now you have colors."
rescue LoadError => e
   puts "Seems you don't have Wirble installed: #{e}"
end

puts "Use 'me' method to retrieve User object. ex: user = me"
def me
  User.find 66524
end

def other_user
  User.last
end

# configure vim
@irb_temp_code = nil

def vim(file=nil)
   file = file || @irb_temp_code || Tempfile.new("irb_tempfile").path+".rb"
   system("vim #{file}")
   if(File.exists?(file) && File.size(file)>0)
      Object.class_eval(File.read(file))
      @irb_temp_code = file
      "File loaded from Vim."
   else
      "No file loaded."
   end
rescue => e
   puts "Error on vim: #{e}"
end
puts "Vim available."
