require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if !self.parent.nil?
            self.parent.children.delete(self)
        end
        @parent = parent_node
        if !parent_node.nil? && !parent_node.children.include?(self)
            parent_node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        self.children.include?(child_node) ? child_node.parent = nil : (raise "Child not present")
    end

    # def inspect
    #     @value.inspect
    #     @parent.inspect
    #     @children.inspect
    # end

    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            first_ele = queue.shift
            if target_value == first_ele.value
                return first_ele
            else
                queue += first_ele.children
            end
        end
        nil
    end

end