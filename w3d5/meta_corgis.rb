class ShoppingList

  # This represents our database
  DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "happiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "happiness" => 33
      },
      "silly_outfit" => {
        "info" => "A tiny Ronald McDonald costume",
        "happiness" => 0
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "happiness" => 31
      },
      "kibble" => {
        "info" => "An old dirty shoe",
        "happiness" => 32
      },
      "silly_outfit" => {
        "info" => "A muddy puddle to roll in",
        "happiness" => 8
      }
    },
    3 => {
      "bone" => {
        "info" => "A rock",
        "happiness" => 4
      },
      "kibble" => {
        "info" => "Avocado skins",
        "happiness" => 17
      },
      "silly_outfit" => {
        "info" => "A Warriors uniform",
        "happiness" => 24
      }
    }
  }
  def initialize(data = DATA)
    @data = data
  end

  def get_bone_info(package_id)
    @data[package_id]["bone"]["info"]
  end

  def get_bone_happiness(package_id)
    @data[package_id]["bone"]["happiness"]
  end

  def get_kibble_info(package_id)
    @data[package_id]["kibble"]["info"]
  end

  def get_kibble_happiness(package_id)
    @data[package_id]["kibble"]["happiness"]
  end

  def get_silly_outfit_info(package_id)
    @data[package_id]["silly_outfit"]["info"]
  end

  def get_silly_outfit_happiness(package_id)
    @data[package_id]["silly_outfit"]["happiness"]
  end
end

class CorgiPerkPackage

  def initialize(shopping_list, package_id)
    @shopping_list = shopping_list
    @package_id = package_id
  end

  def bone
    info = @shopping_list.get_bone_info(@package_id)
    happiness = @shopping_list.get_bone_happiness(@package_id)
    result = "Bone: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @shopping_list.get_kibble_info(@package_id)
    happiness = @shopping_list.get_kibble_happiness(@package_id)
    result = "Kibble: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

  def silly_outfit
    info = @shopping_list.get_silly_outfit_info(@package_id)
    happiness = @shopping_list.get_silly_outfit_happiness(@package_id)
    result = "Silly Outfit: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

end

class MetaCorgiPerkPackage
  def initialize(shopping_list, package_id)
    @shopping_list = shopping_list
    @package_id = package_id
    shopping_list.methods.grep(/^get_(.*)_info$/) { MetaCorgiPerkPackage.define_perk $1 }
  end

  # def method_missing(name, *args)
  #   method_name = name.to_s
  #   get_info = "get_" + method_name + "_info"
  #   get_happy = "get_" + method_name + "_happiness"
  #
  #   info = @shopping_list.send(get_info, @package_id)
  #   happiness = @shopping_list.send(get_happy, @package_id)
  #   result = "#{name}: #{info}: #{happiness} licks"
  #   happiness > 30 ? "* #{result}" : result
  # end

  def self.define_perk(name)
    define_method(name) do
      info = @shopping_list.send("get_#{name}_info", @package_id)
      happiness = @shopping_list.send("get_#{name}_happiness", @package_id)
      display_name = "#{name.split('_').map(&:capitalize).join(' ')}"
      result = "#{display_name}: #{info}: #{happiness} licks"
      happiness > 30 ? "* #{result}" : result
    end

  end
  #
  # define_perk(:bone)
  # define_perk(:kibble)
  # define_perk(:silly_outfit)

  # makes_sound(:woof)
  # makes_sound(:bark)
  # makes_sound(:grr)

  # def self.makes_sound(name)
  #       #define_method is implicitly called on Dog, adding a new method named name.
  #       #The block is the code to run when the method is (later) called on an instance of Dog.
  #   define_method(name) {puts "#{name}"}
  # end

  # These three are actually being called as self.makes_sound
  # Remember, self here is actually Dog
#
#   makes_sound(:woof)
#   makes_sound(:bark)
#   makes_sound(:grr)
# end
#
# dog = Dog.new
# dog.woof
# dog.bark
# dog.grr

end
