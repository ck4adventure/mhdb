module ItemsHelper

  def itypes_options
    opts = Item.itypes.to_a
    opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
  end

  def power_types_options
    opts = Item.power_types.to_a
    opts.map! { |opt_pair| [opt_pair[0], opt_pair[0]] }
    opts.unshift(["none", ""])
    opts
  end

  def cheese_effects_options
    opts = Item.cheese_effects.to_a
    opts.map! { |opt_pair| [opt_pair[0], opt_pair[0]] }
    opts.unshift(["none", ""])
    opts
  end

end
