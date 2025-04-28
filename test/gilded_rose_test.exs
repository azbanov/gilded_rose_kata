defmodule SomeStruct do
  defstruct test: nil
end

defmodule GildedRoseTest do
  use ExUnit.Case

  test "update_item_correctly/1 with item name 'Aged Brie'and quality < 50 " do
    item = %Item{name: "Aged Brie", sell_in: 2, quality: 49}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality + 1
  end

  test "update_item_correctly/1 with item name 'Aged Brie'and quality == 50 " do
    item = %Item{name: "Aged Brie", sell_in: 2, quality: 50}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality
  end

  test "update_item_correctly/1 item name 'Sulfuras, Hand of Ragnaros'" do
    item = %Item{name: "Sulfuras, Hand of Ragnaros", sell_in: 2, quality: 80}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in
    assert updated_item.quality == item.quality
  end

  test "update_item_correctly/1 item name 'Backstage ...' and 5 < sell_in <= 10" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 20}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality + 2
  end

  test "update_item_correctly/1 item name 'Backstage ...' and sell_in > 10" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 23, quality: 20}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality + 1
  end

  test "update_item_correctly/1 item name 'Backstage ...' and sell_in  0 < sell_in <= 5" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 20}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality + 3
  end

  test "update_item_correctly/1 item name 'Backstage ...' and sell_in  0" do
    item = %Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 20}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == 0
  end

  test "update_item_correctly/1 item name 'Conjured ...' and quality is 1" do
    item =  %Item{name: "Conjured Mana Cake", sell_in: 3, quality: 1}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == 0
  end

  test "update_item_correctly/1 item name 'Conjured ...' and quality > 0" do
    item =  %Item{name: "Conjured Mana Cake", sell_in: 3, quality: 5}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality - 2
  end

  test "update_item_correctly/1 item name 'Conjured ...' and quality == 0" do
    item =  %Item{name: "Conjured Mana Cake", sell_in: 3, quality: 0}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality
  end

  test "update_item_correctly/1 normal item and quality == 0" do
    item =  %Item{name: "Elixir of the Mongoose", sell_in: 5, quality: 0}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality
  end

  test "update_item_correctly/1 normal item" do
    item =  %Item{name: "Elixir of the Mongoose", sell_in: 5, quality: 3}

    updated_item = GildedRose.update_item_correctly(item)

    assert updated_item.sell_in == item.sell_in - 1
    assert updated_item.quality == item.quality - 1
  end

  test "update_item_correctly/1 raise error with not correct item" do
    test_str = %SomeStruct{}
    assert_raise ArgumentError, fn -> GildedRose.update_item_correctly(test_str) end
  end
end
