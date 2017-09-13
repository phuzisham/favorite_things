class Item
  @@list = []
  attr_reader :id, :rank
  attr_accessor :name

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id =  @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
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
    @@list.sort_by! {|item| item.rank}
  end

end
