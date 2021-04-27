require_relative 'models/patient'
require_relative 'models/room'
require_relative 'repositories/patient_repository'

room_repo = RoomRepository.new('data/rooms.csv') # load all rooms first
patient_repo = PatientRepository.new('data/patients.csv', room_repo) # as the room repo for some rooms

# ALWAYS LET THE REPOSITORY HANDLE IDS

emilia = Patient.new(name: 'emilia')
brady = Patient.new(name: 'brady')

# patient_repo.add(emilia)
# patient_repo.add(brady)

p patient_repo

# abdul = Patient.new(name: 'abdul')
# kenn = Patient.new(name: 'kenn', cured: true)
# kirk = Patient.new(name: 'kirk')

# vip_room = Room.new(capacity: 2)
# common_room = Room.new(capacity: 15)

# # vip_room.full? # boolean

# vip_room.add_patient(abdul)
# # p abdul
# vip_room.add_patient(kenn)
# vip_room.add_patient(kirk)



# attr_writer
# abdul.room = vip_room
# abdul.name = "Abdul v2"
# abdul.id = 1

# airbnb.com/rooms/1231231

# @room.patients.each do |patient|
#   # build
# end
