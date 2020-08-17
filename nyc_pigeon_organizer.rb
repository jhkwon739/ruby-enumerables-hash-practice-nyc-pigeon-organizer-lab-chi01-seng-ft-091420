require 'pry'

def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_list = {}
  pigeon_attributes, attributes_data = data.keys, data.values
  #gets all the unique names 
  names = get_names(attributes_data).flatten.uniq
  pigeon_list = organize_data(data, names, pigeon_attributes)
end

#return an array of all the names grabbed from pigeon data
def get_names(attributes_array)
  attributes_array.map { |attribute| attribute.values}
end

#returns new organized pigeon list
def organize_data(data, names, pigeon_attributes)
  pigeon_hash = {}
  names.map do |name|
    pigeon_hash[name] = {}
    pigeon_attributes.map do |attribute|
      pigeon_hash[name][attribute] = []
      data[attribute].map do |specific_attribute, value|
        if value.include?(name)
          pigeon_hash[name][attribute] << specific_attribute.to_s
        end
      end
    end
  end
  pigeon_hash
end


    