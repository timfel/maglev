class Module

  #  Class methods

  def self.constants
    _stub_warn("Module.constants")
    []
  end

  def self.nesting
    _stub_warn("Module.nesting")
    []
  end

  # MNI: new

  #  Instance methods

  def <(other)
    _stub_warn("Module#<")
    false
  end

  def <=(other)
    _stub_warn("Module#<=")
    false
  end

  def >(other)
    _stub_warn("Module#>")
    false
  end

  def >=(other)
    _stub_warn("Module#>=")
    false
  end

  def <=>(other)
    _stub_warn("Module#<=>")
    false
  end

  def ===(other)
    _stub_warn("Module#===")
    false
  end

  # class_variables inherited from Behavior

  def clone
    _stub_warn("Module#clone")
    nil
  end

  def include?(other)
    ancests = self.ancestors
    n = 0
    nlim = ancests.size
    while n < nlim
      an_ancest = ancests[n]
      return true if an_ancest.equal?(other)
      imods = an_ancest.included_modules
      k = 0
      klim = imods.size
      while k < klim
        return true if imods[k].equal?(other)
        k += 1
      end
      n += 1
    end
    false
  end

  primitive '_ruby_methods_protection', 'rubyMethods:protection:'

  def instance_methods(inc_super=true)
    _ruby_methods_protection(inc_super, 0);
  end

  def public_instance_methods(inc_super=true)
    _ruby_methods_protection(inc_super, 0);
  end

  def private_class_method(*symbols)
    _stub_warn("Module#private_class_method")
    nil
  end

  def private_instance_methods(inc_super=true)
    _ruby_methods_protection(inc_super, 2);
  end

  def protected_instance_methods(inc_super=true)
    _ruby_methods_protection(inc_super, 1);
  end

  def public_class_method(*symbols)
    _stub_warn("Module#public_class_method")
    nil
  end


  # MNI: append_features
  # MNI: attr
  # MNI: extend_object

  def remove_class_variable(symbol)
    _stub_warn("Module#remove_class_variable")
  end

  # remove_method  implemented in Behavior
  # undef_method implemented in Behavior

end
