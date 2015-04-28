namespace :fill_data do
  desc "fill example data"
  task start: :environment do
    Treasure.create!(long: '50.051227 N',
                     lat:  '19.945704 E')

    Token.create(token: 'sdfsdUFI&FYTUVHOIB')
  end

end
