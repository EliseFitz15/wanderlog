require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Charlotte"
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :trip do
    user
    title "Adventures in P-town"
    description "2015 Annual trip to Provincetown Mass."
    sequence(:startdate) { |n| "2015-07-#{n}" }
  end

  factory :post do
    trip
    headline "Walking down Commercial St."
    content "Lorem ipsum dolor sit amet, vel insolens deserunt salutandi et, prima diceret nonumes
    his ex, pro quot fastidii definitiones ea. Partem aliquip efficiantur sed an, euismod tibique
    voluptatum ne eam, nec nihil mentitum in. Te labitur suscipit duo, no verear urbanitas cum.
    Nec verear dissentias ad, soleat forensibus efficiantur mel at.

    Per te utroque appetere, rebum salutatus hendrerit eu vis. Ea vero meis semper his, per
    fastidii indoctum expetenda at. Fugit dissentiunt usu no, ne summo nemore salutandi cum, mel
    mandamus iracundia definitionem ei. Ei qui utamur verterem volutpat, et expetendis interpretaris sea.

    Ei ridens repudiandae quo, mel mollis propriae ut. Sea apeirian dignissim ne, duo ei duis
    congue repudiandae. Qui id enim tota prodesset. Ponderum patrioque duo te. Autem erant nostrud
    ea qui, graece inermis volumus nec eu."
  end
end
