# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_password_text'

describe PasswordText do

  before do
    CUSTOM_CHARS ||= ['a','b','c','d','e','f']
    CUSTOM_LEN ||= 20
    DEFAULT ||= PasswordText.new
    CUSTOM ||= PasswordText.new(:chars => CUSTOM_CHARS, :len => CUSTOM_LEN)
  end

  describe ".new" do
     
    describe "with default" do

      it "uses default chars" do
        DEFAULT.chars.must_equal PasswordText::DEFAULT_CHARS
      end

      it "uses default len" do
        DEFAULT.len.must_equal PasswordText::DEFAULT_LEN
      end

      it "uses default match" do
        DEFAULT.must_match /^[abcdefghjkmnpqrstuvwxyz]{12}$/  # DEFAULT_CHARS, DEFAULT_LEN
      end

    end

    describe "with custom" do

      it "uses custom chars" do
        CUSTOM.chars.must_equal CUSTOM_CHARS
      end

      it "uses custom len" do
        CUSTOM.len.must_equal CUSTOM_LEN
      end

      it "uses default match" do
        CUSTOM.must_match /^[abcdef]{20}$/  # CUSTOM_CHARS, CUSTOM_LEN
      end

    end

  end
  
  describe "#chars" do

    it "=> Array" do
      DEFAULT.chars.must_be_kind_of Array
    end

    it "uses default chars" do
      DEFAULT.chars.must_equal PasswordText::DEFAULT_CHARS
    end

    it "uses custom chars" do
      CUSTOM.chars.must_equal CUSTOM_CHARS
    end

  end

  describe "#chars=" do

    before do
      @p = PasswordText.new
    end

    it "=" do
      @p.chars=CUSTOM_CHARS
      @p.chars.must_equal CUSTOM_CHARS
    end

  end

  describe "#len" do
      
    it "=> Fixnum" do
      DEFAULT.len.must_be_kind_of Fixnum
    end

    it "uses default len" do
      DEFAULT.len.must_equal PasswordText::DEFAULT_LEN
    end

    it "uses custom len" do
      CUSTOM.len.must_equal CUSTOM_LEN
    end

  end

  describe "#len=" do

    before do
      @p = PasswordText.new
    end

    it "=" do
      @p.len=CUSTOM_LEN
      @p.len.must_equal CUSTOM_LEN
    end

  end

  describe "next" do

    describe "with default" do
      
      before do
        @p = DEFAULT.next
      end

      it "=> PasswordText" do
        @p.must_be_kind_of PasswordText
      end

      it "use default chars" do
        @p.must_match /^[abcdefghjkmnpqrstuvwxyz]{12}$/  # DEFAULT_CHARS, DEFAULT_LEN
      end

      it "use default len" do
        @p.len.must_equal PasswordText::DEFAULT_LEN
      end

    end

    describe "with custom" do

      before do
        @p = CUSTOM.next
      end

      it "=> PasswordText" do
        @p.must_be_kind_of PasswordText
      end

      it "use custom chars" do
        @p.must_match /^[abcdef]{20}$/  # CUSTOM_CHARS, CUSTOM_LEN
      end

      it "use default len" do
        @p.len.must_equal CUSTOM_LEN
      end

    end

  end


end

