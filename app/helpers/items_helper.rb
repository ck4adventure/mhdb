module ItemsHelper

  def category_options
    Category.all.pluck(:name, :id)
    # opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
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
