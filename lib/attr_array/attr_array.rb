require 'active_support/all'

module AttrArray
  extend ActiveSupport::Concern

  class_methods do
    def attr_array(*array_types)
      array_types = array_types.to_a.flatten.compact.map(&:to_sym)

      class_eval do
        class_attribute :array_types
        self.array_types = array_types
      end

      array_types.each do |array_type|
        scope :"with_any_#{array_type}", -> (array) {
          where("#{array_type} && ARRAY[?]::varchar[]", array)
        }
        scope :"with_all_#{array_type}", -> (array) {
          where("#{array_type} @> ARRAY[?]::varchar[]", array)
        }
        scope :"without_any_#{array_type}", -> (array) {
          where.not("#{array_type} && ARRAY[?]::varchar[]", array)
        }
        scope :"without_all_#{array_type}", -> (array) {
          where.not("#{array_type} @> ARRAY[?]::varchar[]", array)
        }

        self.class.class_eval do
          define_method :"all_#{array_type}" do |options = {}, &block|
            subquery_scope = unscoped.select("unnest(#{table_name}.#{array_type}) as array").uniq
            subquery_scope = subquery_scope.instance_eval(&block) if block

            from(subquery_scope).pluck('array')
          end

          define_method :"#{array_type}_cloud" do |options = {}, &block|
            subquery_scope = unscoped.select("unnest(#{table_name}.#{array_type}) as array")
            subquery_scope = subquery_scope.instance_eval(&block) if block

            from(subquery_scope).group('array').order('array').pluck('array, count(*) as count')
          end
        end
      end
    end
  end
end
