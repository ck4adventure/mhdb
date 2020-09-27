# json.physical @weapons.physical do |weapon|
#   json.partial! 'api/items/item', weapon: weapon
# end

@power_types.each do |ptype|
    json.set! ptype do
      json.partial! 'api/items/ptype', weapons: @weapons.where(power_type: ptype)
    end
end