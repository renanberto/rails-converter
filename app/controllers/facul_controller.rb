class FaculController < ApplicationController

  def index
  end

  def create
    word = params[:text]

    if params[:base_insert] == "Binary"
      base_insert = "Binary"
    elsif params[:base_insert] == "Decimal"
      base_insert = "Decimal"
    elsif params[:base_insert] == "Octal"
      base_insert = "Octal"
    elsif params[:base_insert] == "Hexadecimal"
      base_insert = "Hexadecimal"
    elsif params[:base_insert] == "Texto"
      base_insert = "Texto"
    end

    if params[:base_view] == "Binary"
      @result = to_binary(word)
    elsif params[:base_view] == "Decimal"
      @result = to_decimal(word)
    elsif params[:base_view] == "Octal"
      @result = to_octal(word)
    elsif params[:base_view] == "Hexadecimal"
      @result = to_hex(word)     
    end

    render :index
  end

  private

  def to_decimal(text)
    text = text.split ''
    convert_decimal = []
    text.each do |decimal|
      convert_decimal << decimal.ord
    end
    convert_decimal.join
  end

  def to_binary(text)
    bin_array = text.split ''
    binary = bin_array.map do |binary|
      revert = []
      binary = binary.ord
      (1..8).each do
        rest = binary % 2
        binary = binary / 2
        revert << rest
      end
      revert.reverse
    end
    binary.join
  end

  def to_octal(text)
    octal_array = text.split ''
    octal = octal_array.map do |octal|
      revert = []
      octal = octal.ord
      (1..3).each do
        rest = octal % 8
        octal = octal / 8
        revert << rest
      end
      revert.reverse
    end
    octal.join
  end

  def to_hex(text)
    hex_array = text.split ''
    hex = hex_array.map do |hex|
      revert = []
      hex = hex.ord
      (1..2).each do
        rest = hex % 16
        hex = hex / 16

        if rest == 10
           revert << "A"
         elsif rest == 11
           revert << "B"
         elsif rest == 12
           revert << "C"
         elsif rest == 13
           revert << "D"
         elsif rest == 14
           revert << "E"
         elsif rest == 15
           revert << "F"
         else
           revert << rest
        end

      end
      revert.reverse
    end
    hex.join
  end

end