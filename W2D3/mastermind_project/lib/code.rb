class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.keys.include?(char.upcase)}
  end

  attr_reader :pegs
  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise ArgumentError.new"not valid arr"
    end
    @pegs = arr.map {|char| char.upcase}
  end

  def self.random(len)
    arr = []
    while arr.length < len
      arr<< POSSIBLE_PEGS.keys.sample
    end
    code = Code.new(arr)
  end

  def length
    @pegs.length
  end

  def self.from_string(string)
    arr = string.split("")
    Code.new(arr)
  end

  def [](index)
    @pegs[index]
  end

  def num_exact_matches(code)
    #compare code.pegs with @pegs
    num = 0
    code.pegs.each_with_index do |char, i|
      num = num + 1 if char == @pegs[i]
    end
    return num
  end

  def num_near_matches(code)
    num = 0
    mappedj = []
    code.pegs.each_with_index do |char1, i|
      @pegs.each_with_index do |char2, j|
        if char1 == char2 && i == j
          mappedj<< j
        elsif char1 == char2 && char1 != @pegs[i] && char2 != code.pegs[j] && !mappedj.include?(j)
          num = num + 1
          mappedj<< j
          break
        end
      end
    end
    return num
  end

  def ==(code)
    code.pegs == @pegs
  end


end
