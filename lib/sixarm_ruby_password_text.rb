# -*- coding: utf-8 -*-

=begin rdoc

= SixArm.com » Ruby » PasswordText class to generate secure user-friendly passwords

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2011 Joel Parker Henderson
License:: See LICENSE.txt file

PasswordText generates random passwords that are secure and user-friendly.

You can change how passwords are created using the optional parameters.

The return value is a string, so you can do string methods on it.

The default length is 12 characters, which is sufficiently strong for most web applications. You can make this stronger as needed.

The default character array is optimized for usability and accessibility, to help mobile phone users and people with disabilities: all letters are lowercase and letters that look like numbers (specifically, "i", "l", "o") are not used.

== Method

* new: optional, named parameters are length (integer) and alternate character set (array of characters, which forces the password to contain only characters from the passed array)
* chars, chars=: get/set the character array
* length, length=: get/set the length of the password
* next: generate a new PasswordText string, using the same length and same character array

== Examples
  password = PasswordText.new => "avzwbnxremcd"
  password = PasswordText.new(:len => 4) => "avzw"
  password = PasswordText.new(:len => 4, :chars => ['x','y','z']) => "yzyx"
  password.next => "tjqwbesbymzetq"

== SecureRandom

Ruby 1.8.6 and older does not include a secure random number method so this gem checks to see if the SecureRandom class is defined and, if not, requires the sixarm_ruby_secure_random gem (http://github.com/sixarm/sixarm_ruby_secure_random).

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


