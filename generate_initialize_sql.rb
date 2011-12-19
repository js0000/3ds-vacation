# generate_initialize_sql.rb
#   generates sql file to initialize db
#   with vacation-sampler schedule

filename = 'vacation_sample_schedule_25743.txt'
fh = File.new( filename, "r" )
schedule = {}
token = ''
current_token = ''
current_array = []
while( line = fh.gets )
  if( line =~ /^[A-Z][a-z]{2} (\w+) (\d+)/ )
    y = '2011'
    mo = '12'
    d = "#{$2}"
    if( $1 == 'Jan' )
      y = '2012'
      mo = '01'
    end
    token = y + mo + d
    unless schedule.has_key?( token )
      schedule[ token ] = []
      current_token = token
    end

  elsif( line =~ /^  (\d+):(\d+):(\d+)/ ) 
    h = "#{$1}"
    mi = "#{$2}"
    s = "#{$3}"
    t = Time.local( y, mo, d, h, mi, s )
    schedule[ current_token ].push( { 
      :text_date => t.to_s, 
      :iso8601 => t.strftime( "%Y-%m-%d %H:%M:%S" ), 
      :epoch_seconds => t.to_i 
    } )
  end
end

schedule.each_key.sort.each do |k|
  schedule[ k ].each do |bind|
    # could have written to file, or run right into sqlite
    #    but i'll just grab it from terminal window
    puts "INSERT INTO scheduled_samples ( text_date, iso8601, epoch_seconds ) VALUES ( '#{bind[:text_date]}', '#{bind[:iso8601]}', #{bind[:epoch_seconds]} );\n"
  end
end

