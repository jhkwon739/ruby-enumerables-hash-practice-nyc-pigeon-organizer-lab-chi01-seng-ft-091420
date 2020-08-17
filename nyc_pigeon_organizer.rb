require 'pry'

def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_list = {}
  pigeon_attributes, attributes_data = data.keys, data.values
  names = get_names(attributes_data).flatten.uniq
  pigeon_list = condense_data(data, names, pigeon_attributes)
  binding.pry
  
end

def get_names(attributes_array)
  attributes_array.map { |attribute| attribute.values}
end

def condense_data(data, names, pigeon_attributes)
  new_hash = {}
  names.map do |name|
    new_hash[name] = {}
    pigeon_attributes.map do |attribute|
      new_hash[name][attribute] = []
      data[attribute].map do |specific_attribute, value|
        if value.include?(name)
          #new_hash[name] = { attribute => [specific_attribute]}
          new_hash[name][attribute] << specific_attribute
        end
      end
    end
  end
  new_hash
end


    