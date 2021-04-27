class Room
  attr_reader :capacity
  class CapacityReachedError < Exception; end

  def initialize(attributes = {})
    # data?
    @capacity = attributes[:capacity] # integer
    @patients = [] # an array of INSTANCES
  end

  def full?
    @patients.length == capacity
  end

  # vip_room.add_patient(abdul)
  def add_patient(patient)
    unless full?
      # give the patient to the room
      @patients << patient
      # give the room to the patient
      patient.room = self # setting the @room
    else
      raise CapacityReachedError, 'The room is full'
    end
  end
end
