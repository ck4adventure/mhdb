module ItemsHelper

  def itypes_options
    opts = Item.itypes.to_a
    opts.map { |opt_pair| [opt_pair[0], opt_pair[0]] }
  end

  def items_for_type(itype)
    case itype
    when "bait"
      return Item.bait
    when "base"
      return Item.base
    when "charm"
      return Item.charm
    when "collectible"
      return Item.collectible
    when "convertible"
      return Item.convertible
    when "crafting"
      return Item.crafting
    when "map_piece"
      return Item.map_piece
    when "special"
      return Item.special
    when "weapon"
      return Item.weapon
    when "skin"
      return Item.skin
    else
      return Item.first
    end
  end
end
