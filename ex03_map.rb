class Map

  def initialize
    @map =[]
  end

  def assign(key, value)
    keys = @map.map { |ele| ele[0] }
    @map << [key, value] unless keys.include?(key)
  end

  def lookup(key)
    keys = @map.map { |ele| ele[0] }
    index = nil
    keys.each_with_index do |k, i|
      index = i if k == key
    end
    index.nil? ? nil : @map[index][1]
  end

  def remove(key)
    @map.reject! { |ele| ele[0] == key}
  end

  def show
    @map
  end

end
