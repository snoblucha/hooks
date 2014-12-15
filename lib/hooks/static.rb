module Hooks
  class Static
    @@hooks = HookSet.new
    
    def self.run name, scope,  *args
      @@hooks[name.to_sym].run scope, *args if @@hooks[name.to_sym].present?
    end    
    
    def self.add name, method=nil, &block       
      if @@hooks[name.to_sym].nil?
        throw "Hook not defined: #{name}"
      end 
      @@hooks[name.to_sym] << (block || method)             
    end
    
    def self.define name, options = {}
      @@hooks[name.to_sym] = Hook.new(options)
    end
    
    
  end
end