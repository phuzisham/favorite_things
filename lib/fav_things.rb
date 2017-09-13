class Item
  @@list = []
  attr_reader :id 
  attr_accessor :name, :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id =  @@list.length + 1
  end

  def self.all()
    @@list
  end

  def validate?()
    @@list.all? do |item|
      if (item.name != self.name) && (item.rank != self.rank)
        true
      end
    end
  end

  def save()
    @@list.push(self)
  end

  def update?()
    @@list.all? do |item|
      if (item.name == self.name) && (item.rank != self.rank)
        true
      end
    end
  end

  def update()
    @@list.each do |item|
      if (item.name == self.name)
        item.rank = self.rank
      end
    end
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.order()
    @@list.sort_by! {|item| item.rank.to_i}
  end

end
