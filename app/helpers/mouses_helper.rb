module MousesHelper
  def non_locations_options(locs)
    all_locs = Location.all.pluck(:name, :id)
    return Location.all.pluck(:name, :id) if locs.empty?
    mlocs = locs.pluck(:id)
    all_locs.reject! { |loc| mlocs.include?(loc[1]) }
  end
end