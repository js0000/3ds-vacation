# copy_files_and_update.rb


# get list of image, audio files on SD card
# for each file
#  - find creation date
#  - copy file to MM/DD/MMDDHH.ext off of some preconfigured base directory
#  - add records to files table

src_base_dir = '/media/usb0/'
target_base_dir = '/home/js/tmp/vs_files'
db_name = 'vs_db.sqlite3'

require 'fileutils'
require 'sqlite3'
require 'digest/md5'

# this should be a method of df object [or something similar]
#   but it requires less overhead this way
# f: filename
# cl: class
# tbd: target_base_dir
# df: database fileinformation array
def prepare_db_data( f, cl, tbd, df )
  s = File::Stat.new( f )
  if ! s
    puts "couldn't stat #{f}\n"
    next
  end

  # grab extension
  m = /(\.\w+)$/.match( f )
  if m && m[1]
    # yes it's redundant, but this way, if the file is outside of it's directory i have half a chance of knowing what it is
    new_pathfile = s.mtime.strftime( "%m/%d/%m%d%H%M" ) + m[1]
  else  
    puts "couldn't find file extension for #{f}\n"
    next
  end

  md5_checksum = Digest::MD5.hexdigest( File.read( f ) )

  # make directories if needed
  testfile = tbd + s.mtime.strftime( "/%m" )
  if ! File.exists?( testfile )
    Dir.mkdir( testfile )
  end

  testfile += s.mtime.strftime( "/%d" )
  if ! File.exists?( testfile )
    Dir.mkdir( testfile )
  end

  # copy file to new location
  FileUtils.copy( f, "#{tbd}/" + new_pathfile )

  # save data for db push
  df.push( { :class => cl, :created_text_date => s.mtime, :created_epoch_seconds => s.mtime.to_i, :pathfile => new_pathfile, :md5_checksum => md5_checksum } )
end  



snd = []
img = []
dirs = [ Dir.new( src_base_dir ) ]

## generate arrays of src files
dirs.each do |d|
  curr = d.path
  d.each do |e|
    # skip . ..
    if /^\.\.?$/.match( e )
      next
    end
    
    pathfile = "#{curr}/" + e

    # push directories onto array
    if File.directory?( pathfile )
      dirs.push( Dir.new( pathfile ) )
      next
    end

    # change to m4a before going live
    if /\.m4a$/.match( e )
      snd.push( pathfile )
    elsif /\.JPG$/.match( e )
      img.push( pathfile )
    end

  end
  d.close
end

## populate data structure for db inserts
db_file = []
snd.each do |f|
  prepare_db_data( f, 'snd', target_base_dir, db_file )
end

img.each do |f|
  prepare_db_data( f, 'img', target_base_dir, db_file )
end

# fields need to be in order
db = SQLite3::Database.new( db_name ) 
db_file.each do |df|
  field_names = []
  bind = []
  df.each do |k, v|
    field_names.push( k )

    # ints
    if /epoch/.match( "#{k}" )
      bind.push( v )
    else
      bind.push( "'#{v}'" ) 
    end
  end
  insert_sql = [
    'insert into files', 
    '( ' + field_names.join( ', ' ) + ' )', 
    'values',
    '( ' + bind.join( ', ' ) + ' )'
  ].join( ' ' ) 
  db.execute( insert_sql )
end


