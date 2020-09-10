module ItemsHelper
  def itypes_options
    Item.itypes.to_a
  end
end
