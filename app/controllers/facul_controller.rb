class FaculController < ApplicationController

  def index
  end

  def create

    word = params[:text]

    if params[:base_insert] == "Binary"
      convert_insert = binary_to_decimal(word)
    elsif params[:base_insert] == "Decimal"
    elsif params[:base_insert] == "Octal"
      convert_insert = octal_to_decimal(word)
    elsif params[:base_insert] == "Hexadecimal"
      convert_insert = hex_to_decimal(word)
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

    if params[:base_encrypt] == "Sim"
      @encrypt = "Criptografado"
    else
      @encrypt = "Texto nao criptografado."
    end

    render :index
  end

  private

  def binary_to_decimal(text)
    bintodec_array = text.split ''
    i = 0
    result = 0
    bintodec_array.each do |char|
      char = char.to_i
      if char == 1 || char == 0
      result = 2 * i
      i = char.to_i + result
    else
      return "ERROR"
    end
    end
    result
  end

  def octal_to_decimal(text)
    octaltodec_array = text.split ''
    per = octaltodec_array.count
    total = 0
    octaltodec_array.each do |char|
      per = per - 1
      calc2 = char.to_i * 8 ** per
      total = total + calc2
    end
    total
  end

    def hex_to_decimal(text)
    hextodec_array = text.split ''
    per = hextodec_array.count
    total = 0
    hextodec_array.each do |char|
      case char
        when "A"
          char = 10
        when "B"
          char = 11
        when "C"
          char = 12
        when "D"
          char = 13
        when "E"
          char = 14
        when "F"
          char = 15
        end
        if char == ("G".."Z").to_a
          return "ERROR"
        end
      per = per - 1
      calc2 = char.to_i * 16 ** per
      total = total + calc2
    end
    total
  end


  def to_decimal(text)
    text = text.split ''
    convert_decimal = []
    text.each do |decimal|
      convert_decimal << ' ' + decimal.ord.to_s
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
      revert.reverse << ' '
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
      revert.reverse << ' '
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
      revert.reverse << ' '
    end
    hex.join
  end

end