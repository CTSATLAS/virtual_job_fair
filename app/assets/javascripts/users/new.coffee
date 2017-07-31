@App ||= {}
@App.Users ||= {}

@App.Users.new =
  init: () ->
    @initInputMasks()
    @initSelectize()
    @initGeocomplete()
    @fireValidationWhenDateChanged()

  initInputMasks: ->
    $(":input").inputmask();

  initSelectize: ->
    $('[data-provide="selectize"]').selectize
      delimiter: ','
      persist: false
      create: (input) -> { value: input, text: input }

  initGeocomplete: ->
    return if typeof google == 'undefined'

    @hideAddressFields()

    $('#street-address')
      .geocomplete()
      .bind 'geocode:result', @geocodeResult

  geocodeResult: (event, result) =>
    address = result.address_components

    street_number = _.find address, (result) -> result.types[0] == 'street_number'
    route = _.find address, (result) -> result.types[0] == 'route'
    city = _.find address, (result) -> result.types[0] == 'locality'
    county = _.find address, (result) -> result.types[0] == 'administrative_area_level_2'
    state = _.find address, (result) -> result.types[0] == 'administrative_area_level_1'
    zipcode = _.find address, (result) -> result.types[0] == 'postal_code'

    $('#user_jobseeker_profile_attributes_address_1').val "#{street_number.short_name} #{route.short_name}"
    $('#user_jobseeker_profile_attributes_city').val "#{city.short_name}"
    $('#user_jobseeker_profile_attributes_state').val "#{state.short_name}"
    $('#user_jobseeker_profile_attributes_county').val "#{county.short_name.slice(0, -7)}"
    $('#user_jobseeker_profile_attributes_zipcode').val "#{zipcode.short_name}"

    $('#street-address').parent().hide()
    @App.Users.new.showAddressFields()

  hideAddressFields: ->
    $('.address-fields').hide()

  showAddressFields: ->
    $('.address-fields').show()

  fireValidationWhenDateChanged: ->
    #$('[data-provide="datepicker"]').datepicker().on 'changeDate', (event) ->
      #$(this).parsley().validate()

$ ->
  window.App.Users.new.init();
