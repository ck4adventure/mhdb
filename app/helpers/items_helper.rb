module ItemsHelper

  def category_options
    Category.all.pluck(:name, :id)
    # opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
  end

  def power_types_options
    opts = ItemStat.power_types.to_a
    # opts.unshift(["none", "none"])
    opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
  end

  def cheese_effects_options
    opts = ItemStat.cheese_effects.to_a
    opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
  end

end
