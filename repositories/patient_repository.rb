require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @room_repository = room_repository
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(patient)
    # Give the patient an id!
    patient.id = @next_id
    @next_id += 1
    @patients << patient
  end

  def find(id)
    # iterate over the collection and find it by id
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # hash[key] = new_value
      row[:cured] = row[:cured] == 'true'
      row[:id] = row[:id].to_i
      # Ask the room_repository for an instance of a room
      # row[:room] = THIS NEEDS TO BE AN INSTANCE OF A ROOM
      row[:room] = @room_repository.find(row[:id].to_i)
      patient = Patient.new(row)
      @patients << patient
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end
end

#<CSV::Row id:1 name:"abdul" cured:false room_id:"1">
#<CSV::Row id:2 name:"kenn" cured:false room_id:"1">
#<CSV::Row id:3 name:"kirk" cured:false room_id:"2">
