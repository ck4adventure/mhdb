json.array! @bases do |base|
  json.id base.id
  json.name base.name
  json.power base.power
  json.p_bonus base.p_bonus
  json.attr_bonus base.attr_bonus
  json.luck base.luck
  json.cheese_effect base.cheese_effect
end