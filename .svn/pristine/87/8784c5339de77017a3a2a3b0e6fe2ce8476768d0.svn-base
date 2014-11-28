sql = "select * from find_date_configurations(82) where work_date = '#{Date.today}'::date"
result = ActiveRecord::Base.connection.execute sql
File.open('work_time.yml', 'w'){|f| f.write(YAML.dump result.to_a.first )}
YAML.load_file 'work_time.yml'