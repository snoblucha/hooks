module Hooks
  class Static
    @@hooks = HookSet.new
    
    def self.run name, scope,  *args
      @@hooks[name].run scope, *args
    end    
    
    def self.add name, method=nil, &block       
      if @@hooks[name.to_sym].nil?
        throw "Hook not defined: #{name}"
      end 
      @@hooks[name.to_sym] << (block || method)             
    end
    
    def self.define name, options = {}
      @@hooks[name] = Hook.new(options)
    end
    
    
  end
end