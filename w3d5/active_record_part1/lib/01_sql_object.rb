require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    unless @columns
      select_result = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @columns = []
      select_result.first.each do |col|
          @columns << col.to_sym
      end
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) { self.attributes[col] }
      define_method("#{col}=") do |col_value|
          self.attributes[col] = col_value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
      select_result = DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      self.parse_all(select_result)
  end

  def self.parse_all(results)
    result = []
      results.each do |row_hash|
        row = {}
        row_hash.each do |key, value|
          row[key.to_sym] =  value
        end
        result << self.new(row)
      end
      result
  end

  def self.find(id)
      select_result = DBConnection.execute(<<-SQL, id)
        SELECT
          *
        FROM
          #{self.table_name}
        WHERE
          id = ?
      SQL
      self.parse_all(select_result).first
  end

  def initialize(params = {})
    params.each do |attr_name, attr_value|
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else
        self.send("#{attr_name}=", attr_value)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    table_cols = self.class.columns
    table_cols.map {|col_key|  self.send("#{col_key}") }
  end

  def insert
    table_cols = self.class.columns
    col_names = table_cols.drop(1).join(",")
    question_marks = (["?"]*(table_cols.length - 1)).join(",")
    DBConnection.execute(<<-SQL, *self.attribute_values.drop(1))
        INSERT INTO
           #{self.class.table_name} (#{col_names})
        VALUES
          (#{question_marks})
      SQL
    self.send(:id=, DBConnection.last_insert_row_id)
  end

  def update
    table_cols = self.class.columns
    col_names = table_cols.drop(1)
    col_names = (col_names.map {|col| col.to_s + " = ?"}).join(",")
    attr_values = self.attribute_values
    DBConnection.execute(<<-SQL, *attr_values.drop(1), attr_values.first)
        UPDATE
           #{self.class.table_name}
        SET
          #{col_names}
        WHERE
          id = ?
      SQL
  end

  def save
    if self.send(:id).nil?
      self.insert
    else
      self.update
    end
  end
end
