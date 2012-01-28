# initial_file_matching.rb
#  compares scheduled samples timestamps with files timestamps
#  and attempts to match them up


db_name = 'vs_db.sqlite3'

require 'sqlite3'
require 'yaml'

db = SQLite3::Database.new( db_name ) 

## grab data
scheduled_samples = []
db.execute( 'select id, epoch_seconds, text_date from scheduled_samples' ) do |row|
  scheduled_samples.push( { :id => row[0], :epoch_seconds => row[1], :text_date => row[2] } )
end


files = []
db.execute( 'select id, created_epoch_seconds, created_text_date, class from files' ) do |row|
  files.push( { :id => row[0], :epoch_seconds => row[1], :text_date => row[2], :class => row[3] } )
end


## loop through files
# add 'files' key to scheduled_samples 
# if epoch time is within 40 minutes of sample scheduled time
# populate non_matched_files with outliers
non_matched_files = []
files.each do |f|
  matched = false
  scheduled_samples.each do |ss|
    
    time_diff = ss[:epoch_seconds] - f[:epoch_seconds]
    if( ( time_diff.abs > 0 ) && ( time_diff.abs < 1200 ) ) 
      if ( ! ss[:files] )  
        ss[:files] = [] 
      end
      ss[:files].push( { :file_id => f[:id], :class => f[:class], :time_diff => time_diff } )
      matched = true
      break
    end  
  end

  if( ! matched ) 
    non_matched_files.push( f )
  end
end

## loop through samples
# if 'files' key has exactly 2 elements, that are within 20 minutes of each other, leave them alone
# populate non_matched_schedule_samples
non_matched_schedule_samples = []
# holding area
non_matched_file_ids = []
scheduled_samples.each do |ss|

  if( ( ! ss[:files] ) || ( ss[:files].length == 1 ) )
    non_matched_schedule_samples.push( ss )
    next
  end

  # check for one img and one snd
  if ss[:files].length == 2
    f_img = false
    f_snd = false
    ss[:files].each do |f|
      if f[:class] == 'img' 
        f_img = true
      elsif f[:class] == 'snd' 
        f_snd = true
      end
    end

    if( ( f_img ) && ( f_snd ) )
      next
    # either both img or both snd  
    else
      # find closest
      closest = {}
      ss[:files].each do |f|
        if ! closest[:time_diff] 
	  closest[:file_id] = f[:file_id]
	  closest[:time_diff] = f[:time_diff]
	elsif f[:time_diff].abs < closest[:time_diff].abs 
	  closest[:file_id] = f[:file_id]
	  closest[:time_diff] = f[:time_diff]
	end
      end

      # and save it
      ss[:files].each do |f|
        if f[:file_id] == closest[:file_id] 
          next
	else
	  non_matched_file_ids.push( f[:file_id] )
	  ss[:files].delete( f )
	end
      end
    end
  end

  # save files that are closest to scheduled times
  if ss[:files].length > 2
    c_img = {}
    c_snd = {}
    
    # find closest
    ss[:files].each do |f|
      if f[:class] == 'img'
        if ! c_img[:time_diff] 
	  c_img[:file_id] = f[:file_id]
	  c_img[:time_diff] = f[:time_diff]
        elsif f[:time_diff].abs < c_img[:time_diff].abs 
	  c_img[:file_id] = f[:file_id]
	  c_img[:time_diff] = f[:time_diff]
        end
      else	
        if ! c_snd[:time_diff] 
	  c_snd[:file_id] = f[:file_id]
	  c_snd[:time_diff] = f[:time_diff]
        elsif f[:time_diff].abs < c_snd[:time_diff].abs 
	  c_snd[:file_id] = f[:file_id]
	  c_snd[:time_diff] = f[:time_diff]
        end
      end	
    end

    # populate
    ss[:files].each do |f|
      if f[:class] == 'img'
        if f[:file_id] == c_img[:file_id] 
          next
        else
          non_matched_file_ids.push( f[:file_id] )
	  ss[:files].delete( f )
	end
      else
        if f[:file_id] == c_snd[:file_id] 
          next
	else
          non_matched_file_ids.push( f[:file_id] )
	  ss[:files].delete( f )
	end
      end
    end
  end
end

non_matched_file_ids.each do |fid|
  files.each do |f|
    if fid == f[:id]
      non_matched_files.push( f )
      break
    end
  end
end

print "\n\n" + 'non_matched_schedule_samples' + "\n"
print non_matched_schedule_samples.to_yaml
print "\n\n" + 'non_matched_file_ids' + "\n"
print non_matched_file_ids.to_yaml
print "\n\n" + 'non_matched_files' + "\n"
print non_matched_files.to_yaml

print "\n\n" + 'counts' + "\n"
print 'non_matched_schedule_samples: ' + "#{non_matched_schedule_samples.length}\n"
print 'non_matched_files: ' + "#{non_matched_files.length}\n"
