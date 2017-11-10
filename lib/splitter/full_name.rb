# frozen_string_literal: true

module Splitter
  PREFIXES = %w[
    de da la du del dei vda. dello della degli delle van von der den heer ten ter vande vanden vander voor ver aan mc
  ].freeze

  class FullName
    def initialize(full_name)
      @full_name  = full_name
      @first_name = []
      @last_name  = []
      split!
    end

    def split!
      @units = @full_name.split(/\s+/)

      while (@unit = @units.shift)
        if prefix? || with_apostrophe? || (first_name? && last_unit? && !initial?)
          @last_name << @unit && break
        else
          @first_name << @unit
        end
      end

      @last_name += @units
      adjust_exceptions!
    end

    def first_name
      @first_name.empty? ? nil : @first_name.join(' ')
    end

    def last_name
      @last_name.empty? ? nil : @last_name.join(' ')
    end

    private

    def prefix?
      PREFIXES.include?(@unit.downcase)
    end

    # M or W.
    def initial?
      @unit =~ /^\w\.?$/
    end

    # O'Connor, d'Artagnan match
    # Noda' doesn't match
    def with_apostrophe?
      @unit =~ /\w{1}'\w+/
    end

    def last_unit?
      @units.empty?
    end

    def first_name?
      !@first_name.empty?
    end

    def adjust_exceptions!
      return if @first_name.size <= 1

      if last_name.match?(/^(van der|(vda\. )?de la \w+$)/i)
        loop do
          @last_name.unshift @first_name.pop
          break if @first_name.size <= 2
        end
      end
    end
  end

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def full_name=(name)
    self.first_name, self.last_name = split(name)
  end

  private

  def split(name)
    name = name.to_s.strip.gsub(/\s+/, ' ')

    if name.include?(',')
      name
        .split(/\s*,\s*/, 2) # ",van  helsing" produces  ["", "van helsing"]
        .map { |u| u.empty? ? nil : u } # but it should be [nil, "van helsing"] by lib convection
    else
      splitter = Splitter.new(name)
      [splitter.first_name, splitter.last_name]
    end
  end

  module_function :split
end
