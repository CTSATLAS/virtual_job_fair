module ApplicationHelper
  def greeting
    hour = Time.now.strftime('%H').to_i
    first_name = current_user.first_name

    if hour < 12
      "Good morning, #{first_name}!"
    elsif hour >= 12 && hour < 17
      "Good afternoon, #{first_name}!"
    else
      "Good evening, #{first_name}!"
    end
  end

  def link_to_class(klass, active_if:)
    controller_from_path = Rails.application.routes.recognize_path(active_if)[:controller]

    klass << ' active' if controller_name == controller_from_path
    klass
  end

  def us_states
    [
      %w(Alabama AL),
      %w(Alaska AK),
      %w(Arizona AZ),
      %w(Arkansas AR),
      %w(California CA),
      %w(Colorado CO),
      %w(Connecticut CT),
      %w(Delaware DE),
      %w(District of Columbia DC),
      %w(Florida FL),
      %w(Georgia GA),
      %w(Hawaii HI),
      %w(Idaho ID),
      %w(Illinois IL),
      %w(Indiana IN),
      %w(Iowa IA),
      %w(Kansas KS),
      %w(Kentucky KY),
      %w(Louisiana LA),
      %w(Maine ME),
      %w(Maryland MD),
      %w(Massachusetts MA),
      %w(Michigan MI),
      %w(Minnesota MN),
      %w(Mississippi MS),
      %w(Missouri MO),
      %w(Montana MT),
      %w(Nebraska NE),
      %w(Nevada NV),
      %w(New Hampshire NH),
      %w(New Jersey NJ),
      %w(New Mexico NM),
      %w(New York NY),
      %w(North Carolina NC),
      %w(North Dakota ND),
      %w(Ohio OH),
      %w(Oklahoma OK),
      %w(Oregon OR),
      %w(Pennsylvania PA),
      %w(Puerto Rico PR),
      %w(Rhode Island RI),
      %w(South Carolina SC),
      %w(South Dakota SD),
      %w(Tennessee TN),
      %w(Texas TX),
      %w(Utah UT),
      %w(Vermont VT),
      %w(Virginia VA),
      %w(Washington WA),
      %w(West Virginia WV),
      %w(Wisconsin WI),
      %w(Wyoming WY)
    ]
  end

  def florida_counties
    [
      %w(Alachua Alachua),
      %w(Baker Baker),
      %w(Bay Bay),
      %w(Bradford Bradford),
      %w(Brevard Brevard),
      %w(Broward Broward),
      %w(Calhoun Calhoun),
      %w(Charlotte Charlotte),
      %w(Citrus Citrus),
      %w(Clay Clay),
      %w(Collier Collier),
      %w(Columbia Columbia),
      %w(DeSoto DeSoto),
      %w(Dixie Dixie),
      %w(Duval Duval),
      %w(Escambia Escambia),
      %w(Flagler Flagler),
      %w(Franklin Franklin),
      %w(Gadsden Gadsden),
      %w(Gilchrist Gilchrist),
      %w(Glades Glades),
      %w(Gulf Gulf),
      %w(Hamilton Hamilton),
      %w(Hardee Hardee),
      %w(Hendry Hendry),
      %w(Hernando Hernando),
      %w(Highlands Highlands),
      %w(Hillsborough Hillsborough),
      %w(Holmes Holmes),
      %w(Indian Indian),
      %w(Jackson Jackson),
      %w(Jefferson Jefferson),
      %w(Lafayette Lafayette),
      %w(Lake Lake),
      %w(Lee Lee),
      %w(Leon Leon),
      %w(Levy Levy),
      %w(Liberty Liberty),
      %w(Madison Madison),
      %w(Manatee Manatee),
      %w(Marion Marion),
      %w(Martin Martin),
      %w(Miam Miam),
      %w(Monroe Monroe),
      %w(Nassau Nassau),
      %w(Okaloosa Okaloosa),
      %w(Okeechobee Okeechobee),
      %w(Orange Orange),
      %w(Osceola Osceola),
      %w(Palm Palm),
      %w(Pasco Pasco),
      %w(Pinellas Pinellas),
      %w(Polk Polk),
      %w(Putnam Putnam),
      %w(Santa Santa),
      %w(Sarasota Sarasota),
      %w(Seminole Seminole),
      %w(St. Johns St. Johns),
      %w(St. Lucie St. Lucie),
      %w(Sumter Sumter),
      %w(Suwannee Suwannee),
      %w(Taylor Taylor),
      %w(Union Union),
      %w(Volusia Volusia),
      %w(Wakulla Wakulla),
      %w(Walton Walton),
      %w(Washington Washington)]
  end
end
