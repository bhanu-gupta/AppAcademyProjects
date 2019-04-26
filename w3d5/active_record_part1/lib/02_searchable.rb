require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_arr = []
    values = params.values
    params.each do |key, value|
      where_arr << (key.to_s + " = ?")
    end
    where_line = where_arr.join(" AND ")
    sql_results = DBConnection.execute(<<-SQL, *values)
        SELECT
          *
        FROM
           #{self.table_name}
        WHERE
          #{where_line}
    SQL
    self.parse_all(sql_results)
  end
end

class SQLObject
  extend Searchable
end
