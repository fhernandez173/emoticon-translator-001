# require modules here
require 'pry'
require 'yaml'
  # yaml_file = YAML.load_file("./lib/emoticons.yml")

def load_library(file_path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  YAML.load_file(file_path).each do |emotion, character_array|
    # binding.pry
    new_hash["get_meaning"][character_array[1]] ||= emotion
    new_hash["get_emoticon"][character_array[0]] ||= character_array[1]
  end
  new_hash
  # binding.pry
end

dummy_hash = {
  "get_meaning"=>
   {"☜(⌒▽⌒)☞"=>"angel",
    "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
    "(ΘεΘ;)"=>"bored",
    "(゜.゜)"=>"confused",
    "(#^.^#)"=>"embarrased",
    ">゜))))彡"=>"fish",
    "(^0_0^)"=>"glasses",
    "(￣ー￣)"=>"grinning",
    "(＾ｖ＾)"=>"happy",
    "(*^3^)/~☆"=>"kiss",
    "(Ｔ▽Ｔ)"=>"sad",
    "o_O"=>"surprised",
    "(^_-)"=>"wink"},
"get_emoticon"=>
   {"O:)"=>"☜(⌒▽⌒)☞",
    ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
    ":O"=>"(ΘεΘ;)",
    "%)"=>"(゜.゜)",
    ":$"=>"(#^.^#)",
    "><>"=>">゜))))彡",
    "8D"=>"(^0_0^)",
    "=D"=>"(￣ー￣)",
    ":)"=>"(＾ｖ＾)",
    ":*"=>"(*^3^)/~☆",
    ":'("=>"(Ｔ▽Ｔ)",
    ":o"=>"o_O",
    ";)"=>"(^_-)"}
}

# perhaps use a counter variable, or any variable to keep track of the emoticon

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path).each do |emotion, char_hash|
    # binding.pry
    # returns the Japanese equivalent of an English grinning
    # i am given ":)" in emoticon argument, which is found in get_emoticon
    char_hash.each do |original, translation|
      if original == emoticon
        return translation
      end
    end
    # binding.pry
  end

  if load_library(file_path).include?(emoticon) == false
     "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path).each do |emotion, char_hash|
    char_hash.each do |original, translation|
      if original == emoticon
        return translation
      end
    end
  end
  if load_library(file_path).include?(emoticon) == false
     "Sorry, that emoticon was not found"
  end
end












#
#
#
