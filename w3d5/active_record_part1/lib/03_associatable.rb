require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
     self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    self.foreign_key = options[:foreign_key] || "#{name}_id".to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || name.to_s.camelcase
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    self.foreign_key = options[:foreign_key] || "#{self_class_name.underscore}_id".to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || name.to_s.singularize.camelcase
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) {
      foreign_key_val = self.send(options.foreign_key)
      select_result = DBConnection.execute(<<-SQL, foreign_key_val)
        SELECT
          *
        FROM
          #{options.table_name}
        WHERE
          #{options.primary_key} == ?
      SQL
      options.model_class.parse_all(select_result).first
    }
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)
    define_method(name) {
      table_name = (options.model_class.to_s.downcase + 's').underscore
      primary_key_val = self.send(options.primary_key)
      select_result = DBConnection.execute(<<-SQL, primary_key_val)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          #{options.foreign_key} == ?
      SQL
      options.model_class.parse_all(select_result)
    }
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
