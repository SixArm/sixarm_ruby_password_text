# -*- coding: utf-8 -*-
require 'test/unit'
require 'sixarm_ruby_password_text'

class PasswordTextTest < Test::Unit::TestCase

  CUSTOM_CHARS = ['a','b','c','d','e','f']
  CUSTOM_LEN = 20

  def test_default_chars
    s=PasswordText.new
    assert_equal(PasswordText::DEFAULT_CHARS, s.chars, s)
  end

  def test_default_len
    s=PasswordText.new
    assert_equal(PasswordText::DEFAULT_LEN, s.len, s)
  end

  def test_new
    s=PasswordText.new
    assert_equal(0, s=~/^[abcdefghjkmnpqrstuvwxyz]{12}$/, s)
  end

  def test_chars
    s=PasswordText.new
    s.chars=CUSTOM_CHARS
    assert_equal(CUSTOM_CHARS, s.chars)
  end

  def test_len
    s=PasswordText.new
    s.len=CUSTOM_LEN
    assert_equal(CUSTOM_LEN, s.len)
  end

  def test_new_with_options
    s=PasswordText.new(:chars => CUSTOM_CHARS, :len => CUSTOM_LEN)
    assert_equal(CUSTOM_CHARS, s.chars, "password custom chars")
    assert_equal(CUSTOM_LEN, s.len, "password custom len")
    assert_equal(0, s=~/^[abcdef]{20}$/, "password match")
  end

  def test_next
    s=PasswordText.new.next
    assert_equal(0, s=~/^[abcdefghjkmnpqrstuvwxyz]{12}$/, s) 
  end

  def test_next_with_options
    s=PasswordText.new(:chars => CUSTOM_CHARS, :len => CUSTOM_LEN).next
    assert_equal(0, s=~/^[abcdef]{20}$/, s) 
  end

end




