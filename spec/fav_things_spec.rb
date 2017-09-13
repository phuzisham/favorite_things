require('pry')
require('rspec')
require('fav_things')


describe("Item") do
  before() do
    Item.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos", 2)
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos", 2)
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos", 2)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos", 2)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end

  describe(".order") do
    it("sorts items by rank") do
      item = Item.new("apples", 8)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      test_list = Item.order
      expect(test_list).to(eq(Item.all))
    end
  end

  describe("#save") do
    it("sorts items by rank") do
      item = Item.new("apples", 8)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      test_list = Item.order
      test_item = Item.new("apples", 8)
      expect(test_item.save).to(eq(test_list))
    end
  end

  describe('#validate?') do
    it('will return false if you attempt to push duplicate item') do
      item = Item.new("apples", 8)
      item.save()
      item2 = Item.new("apples", 2)
      expect(item2.validate?).to(eq(false))
    end
  end

  describe('#update?') do
    it('will return true for update?') do
      item = Item.new("apples", 8)
      item.save()
      item2 = Item.new("apples", 2)
      expect(item2.update?).to(eq(true))
    end
  end

  describe('#update') do
    it('will change rank of item') do
      item = Item.new("apples", 8)
      item.save()
      item2 = Item.new("apples", 2)
      item2.update()
      expect(item.rank).to(eq(2))
    end
  end

end
