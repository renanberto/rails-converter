class Converter
  BINARY      = 'Binary'
  DECIMAL     = 'Decimal'
  HEXADECIMAL = 'Hexadecimal'
  OCTAL       = 'OCTAL'

  attr_reader :text, :source, :target

  def initialize(options)
    @text = options[:text]
    @source = options[:source]
    @target = options[:target]
    @encrypt = options[:encrypt]
  end

  def convert
    case target
    when HEXADECIMAL
      result = to_hex(text)
    when BINARY
      result = to_binary(text)
    when DECIMAL
      result = to_decimal(text)
    when OCTAL
      result = to_octal(text)
    else
      result = text
    end

    result
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
    bin_array.map do |binary|
      revert = []
      binary = binary.ord
      (1..8).each do
        rest = binary % 2
        binary = binary / 2
        revert << rest
      end
      revert.reverse << ' '
    end.join
  end

  def to_octal(text)
    octal_array = text.split ''
    octal_array.map do |octal|
      revert = []
      octal = octal.ord
      (1..3).each do
        rest = octal % 8
        octal = octal / 8
        revert << rest
      end
      revert.reverse << ' '
    end.join
  end

  def to_hex(text)
    hex_array = text.split ''
    hex_array.map do |hex|
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
    end.join
  end
end
