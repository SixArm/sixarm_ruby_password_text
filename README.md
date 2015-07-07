# Ruby » <br> PasswordText class to generate secure user-friendly passwords

* Doc: <http://sixarm.com/sixarm_ruby_password_text/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_password_text>
* Repo: <http://github.com/sixarm/sixarm_ruby_password_text>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Generates strong yet user-friendly passwords using Ruby's secure random cryptographic functions.

You can change how passwords are created using the optional parameters and the return value is a string, so you can do string methods on it.

For docs go to <http://sixarm.com/sixarm_ruby_password_text/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_password_text

Bundler:

    gem "sixarm_ruby_password_text", "~>1.3.0"

Require:

    require "sixarm_ruby_password_text"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_password_text --trust-policy HighSecurity


## Details

The default length is 12 characters, which is sufficiently strong for most web applications. You can make this stronger as needed.

The default character array is optimized for usability and accessibility, to help mobile phone users and people with disabilities: all letters are lowercase and letters that look like numbers (specifically, "i", "l", "o") are not used.


## Examples

    require "sixarm_ruby_password_text"
    password = PasswordText.new => "avzwbnxremcd"
    password = PasswordText.new(:length => 4) => "avzw"
    password = PasswordText.new(:length => 4, :chars => ['x','y','z']) => "yzyx"


## SecureRandom

Ruby 1.8.6 and older does not include a secure random number method so this gem checks to see if the SecureRandom class is defined and, if not, requires the sixarm_ruby_secure_random gem (http://github.com/sixarm/sixarm_ruby_secure_random).
