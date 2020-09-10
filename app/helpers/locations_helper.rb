module LocationsHelper
  def unused_mice_options(mice)
    all_mice = Mouse.all.pluck(:name, :id)
    return all_mice if mice.empty?
    mmice = mice.pluck(:id)
    all_mice.reject! { |mice| mmice.include?(mice[1]) }
  end
end
