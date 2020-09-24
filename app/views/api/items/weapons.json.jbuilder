json.weapons @weapons do |wep|
  json.id wep.id
  json.name wep.name
  json.power_type @wep.power_type
  json.power @wep.power
  json.p_bonus @wep.p_bonus
  json.attr_bonus @wep.attr_bonus
  json.luck @wep.luck
  json.cheese_effect @wep.cheese_effect
end