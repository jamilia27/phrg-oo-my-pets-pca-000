class Owner
  require 'pry'
  attr_accessor :pets, :name, :mood
  attr_reader :species

  @@owners = []

  def initialize(species = "human", name)
    @species = species
    @@owners << self
    @pets = {fishes: [], cats: [], dogs: []}
    @name = name
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.size
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_doggo = Dog.new(name)
    @pets[:dogs] << new_doggo
  end

  def walk_dogs
    @pets[:dogs].each {|doggo| doggo.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|kitty| kitty.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |animals, animal_array|
      animal_array.each do |animal|
        animal.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end

