inputs = ARGV
inputs.each_with_index do |input, i|
  puts "Input at #{i} is #{input}!"
end
puts "ARGV splatted is: #{ARGV.inspect}"
puts "FILE is #{__FILE__}!"
puts "$0 is #{$0}!"
puts "$: is #{$:}!"
puts "$LOAD_PATH is #{$LOAD_PATH}!"
puts "I'm a command line script now!" if $0 == __FILE__