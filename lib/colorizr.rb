class String
  COLORS = { red:   31, green: 32, yellow: 33,
             blue:  34, pink:  95, light_blue: 94,
             white: 97, black: 30, light_grey: 37 }

  def self.create_colors
    COLORS.each do |color, color_code|
      self.send(:define_method, color) do
        "\e[#{color_code}m #{self} \e[0m"
      end
    end
  end

  def self.colors
    COLORS.keys
  end

  def self.sample_colors
    colors.each do |color|
      puts "This is #{color.to_s.send(color)}"
    end
  end
end

String.create_colors
