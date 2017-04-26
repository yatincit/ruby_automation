####################
##### Load Data ####
####################

def read_excel(name)
  require 'roo'
  require 'spreadsheet'
  @myRoot = File.join(File.dirname(__FILE__), '/')
  book = Roo::Spreadsheet.open("#{@myRoot}/#{name}.xlsx", extension: :xlsx)

  obj_repo = book.sheet("object")
  # Loading the data from "object" spreedsheet
  @obj_repo_row = {}
  obj_repo.each do |row|
    row.each do |x|
      @obj_repo_row[row[0]] = row[1..11]
    end
  end

  user_data = book.sheet("data")
  # Loading the data from "data" spreedsheet
  @user_data_row = {}
  user_data.each do |row|
    row.each do |x|
      @user_data_row[row[0]] = row[1]
    end
  end

  # Removing the first row data from the excel(column name).
  @obj_repo_row.delete('Key')
  @user_data_row.delete('Key')

end

######################################################
### Below method Used for create the unique Name
### Using the timestamp
### Read the value during run time for the validation
### For Example generate_uniq_timestamp ("MyName")
### Return "MyANme201704251554"
######################################################

def generate_uniq_timestamp (text)
  cur_time_stmp = Time.now.strftime("%Y%m%d%H%M").to_s
  case text.downcase + "_stamp"
    when "firstname_stamp"
      $title = "#{arg1.downcase}#{cur_time_stmp}"
      uniq_text = $title
    when "lastname_stamp"
      $description = "#{arg1.downcase}#{cur_time_stmp}"
      uniq_text = $description
    else
      uniq_text = text
  end
  return uniq_text
end

def read_temp_val(text)
  case text.downcase + "_stamp"
    when "firstname_stamp"
      data = $title
    when "lastname_stamp"
      data = $description
    else
      data = text
  end
end

#####################################################
### generating the time Stamp, with 15 min interval
### For Example: time_interval(20)
### current Time: 2017-04-26 10:45:05 -0700
### Return: 2017-04-26 11:05:00 -0700
#####################################################

def time_interval(inter_val_num)

  require 'rubygems'
  require 'active_support'
  require 'active_support/time'
  inter_val_num = 20
  cur_time = Time.now
  comp_time = cur_time - cur_time.sec - cur_time.min%15*60
  base_time = comp_time + 1.hour

  if comp_time < base_time
    comp_time = comp_time + inter_val_num.minutes
  end
  return comp_time

end

################################################
### generating Date based on the argument passed
################################################

def get_date(day=nil, month=nil, year=nil, offset=nil)

  if offset < 0
  elsif offset > 0
    
  end

end