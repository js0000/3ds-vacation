# scheduler_printer.rb
# prints out times for vacation sampling schedule
# dec 17 2011-2 jan 2012

require 'date'
require 'yaml'

# english_date
# epoch_seconds
# number of samples
# sample_times []


## populate schedule with dates

schedule = []

# dec
y = 2011
m = 12
15.times do |i|
  d = i + 17
  
  t = Time.local( y, m, d )
  ed = t.to_s.sub!( / 00:00.*$/, '' )
  schedule.push( { :english_date => ed, :epoch_seconds => t.to_i, :number_of_samples => 0, :sample_times => [] } )
end

# jan
y = 2012
m = 1
2.times do |i|
  d = i + 1

  t = Time.local( y, m, d )
  ed = t.to_s.sub!( / 00:00.*$/, '' )
  schedule.push( { :english_date => ed, :epoch_seconds => t.to_i, :number_of_samples => 0, :sample_times => [] } )
end


## prepare to print

sample_counts = []
schedule.length.times do |i|
  sample_counts.push( i )
end
sample_counts.shuffle!

# midnight to 7AM
offset = 60 * 60 * 7
# 7AM to 11PM
total_duration = 60 * 60 * 16


filename = 'vacation_sample_schedule_' + Process.pid.to_s + '.txt'
f = File.new( filename, 'w' )
f.puts "# #{filename}\n# generated: #{Time.new}\n\n"
f.puts "# schedule for vacation sample collection\n\n\n"

## fill in all data and print output

schedule.each do |sch|
  c = sample_counts.pop
  
  # housekeeping [prolly unneeded, but helpful in debugging]
  sch[:number_of_samples] = c

  # use c to divide time space and populate :sample_times
  sample_duration = total_duration / ( c + 1 )

  curr = sch[:epoch_seconds] + offset
  c.times do |i|
    curr += sample_duration
    sch[:sample_times].push( Time.at( curr ).strftime( "%H:%M:%S" ) ) 
  end

  # write it!
  f.puts "#{sch[:english_date]}\n----------\n"
  sch[:sample_times].each do |st|
    f.puts "  #{st}\n"
  end
  f.puts "\n\n"

end


f.puts



