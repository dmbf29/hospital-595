class Patient
  attr_reader :name
  attr_accessor :room, :id
  # data + behavior
  # instances arent store here
  # .new => .initialize
  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end

  # attr_writer
  # abdu.room = new_room
  # def room=(new_room)
  #   @room = new_room
  # end

end
