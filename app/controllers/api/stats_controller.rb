class Api::StatsController < ApplicationController
  def main
    @rankCount = Rank.count
    @regionCount = Region.count
    @locationCount = Location.count
    @groupCount = Group.count
    @miceCount = Mouse.count
    @basesCount = Item.base.count
    @weaponCount = Item.weapon.count
    @baitCount = Item.bait.count
    @itemsCount = Item.where(itype: ["collectible", "convertible", "crafting", "special",]).count

    render 'api/stats/main'
  end

end
