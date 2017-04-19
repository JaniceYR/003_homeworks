class LRUCache
  def initialize(cache_size)
    @cache = []
    @cache_size = cache_size
  end

  def count
    # returns number of elements currently in cache
    @cache.size
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      recently_used(el)
    else
      if count < @cache_size
        @cache << el
      else
        @cache.shift
        @cache << el
      end
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

  private
  # helper methods go here!
  def recently_used(el)
    @cache.delete(el)
    # puts "#{el} is deleted and reassign"
    @cache << el
  end

end


cache = LRUCache.new(4)
# p cache.count

  cache.add("I walk the line")
  cache.add(5)
  cache.add([1,2,3])

  cache.add(5)
  cache.add(-5)
  cache.add({a: 1, b: 2, c: 3})
  cache.add([1,2,3,4])
  cache.add("I walk the line")
  cache.add(:ring_of_fire)
  cache.add("I walk the line")
  cache.add({a: 1, b: 2, c: 3})


  cache.show
# => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
