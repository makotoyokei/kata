class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = "Aged Brie"
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  MAX_QUALITY = 50
  MIN_QUALITY = 0


  def update_quality()
    @items.each do |item|
      case item.name
      when AGED_BRIE
        return increment_quality_depend_on_sell_in(item, 2) if item.sell_in <= 0
        return increment_quality_depend_on_sell_in(item)
      when BACKSTAGE
        return item.quality = 0 if item.sell_in <= 0
        return increment_quality_depend_on_sell_in(item, 3) if item.sell_in <= 5
        return increment_quality_depend_on_sell_in(item, 2) if item.sell_in <= 10
        return increment_quality_depend_on_sell_in(item)
      when SULFURAS
        return
      else
        return decrement_quality(item, 2) if item.sell_in <= 0
        return decrement_quality(item)
      end
    end
  end

  def increment_quality_depend_on_sell_in(item, quality = 1)
    item.quality = item.quality + quality if item.quality < MAX_QUALITY
  end

  def decrement_quality(item, quality = 1)
    item.quality = item.quality - quality if item.quality > MIN_QUALITY
  end

end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
