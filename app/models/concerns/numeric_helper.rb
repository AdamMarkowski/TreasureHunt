module NumericHelper
  extend ActiveSupport::Concern

  def convert_coordinates(coord)
    if coord.to_s =~ /^[-+]?\d*\.?\d*?$/
      coord
    else
      coord     = coord.to_s
      direction = coord[-1, 1].downcase
      coord     = coord.chop.gsub(' ', '').to_f

      if ['w', 's'].include?(direction)
        coord = coord * -1
      end

      coord
    end
  end

end
