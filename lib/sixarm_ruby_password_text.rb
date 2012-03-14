# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


if !defined?(SecureRandom)
  begin
    # First we will try to load the Ruby standard library
    require 'securerandom'
  rescue
    # Second we will try to load our own SecureRandom gem library
    require 'sixarm_ruby_secure_random'
  end
end


class PasswordText < String


 # Default characters
 DEFAULT_CHARS=['a','b','c','d','e','f','g','h','j','k','m','n','p','q','r','s','t','u','v','w','x','y','z']

 # Default length
 DEFAULT_LEN=12


 # Return a new secure random password.
 #
 # The password has a given length (or the default)
 # and is picked from a given character array (or the default).
 #
 # To set the default length, see #length
 #
 # To set the default character array, see #chars
 #
 # ==Examples
 #   password = PasswordText.new => "avzwbnxremcd"
 #   password = PasswordText.new(4) => "avzw"
 #   password = PasswordText.new(4,['x','y','z']) => "yzyx"

 def initialize(opts={})
   self.chars= opts[:chars] || DEFAULT_CHARS
   self.len= opts[:len] || DEFAULT_LEN
   super(Array.new(len){chars[SecureRandom.random_number(chars.size)]}.join)
 end


 # Get the default character array.
 #
 # To improve usability, the passwords only use lowercase letters.
 # This helps people who use mobile phones and also helps people
 # who have some kinds disabilities related to manual dexterity.
 # We also omit letters that may be confused with numbers: "i", "l", "o".
 #
 # We choose this as a valuable tradeoff between usability and complexity.

 def chars
  @chars || DEFAULT_CHARS
 end


 # Set the default character array

 def chars=(chars)
  @chars=chars
 end


 # Get the default length
 #
 # We choose 12 characters to make a sufficiently strong password.
 # for usual web applications. You can make this stronger as needed.

 def len
  @len || DEFAULT_LEN
 end


 # Set the default length

 def len=(length)
  @len=length
 end


 # Return the next random password of the same length and character array

 def next
   PasswordText.new(:chars => chars, :len => len)
 end


end


