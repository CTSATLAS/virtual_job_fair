@App ||= {}
@App.Users ||= {}

@App.Users.new =
  init: () ->
    @initInputMasks()
    @hideAddressFields()
    @initGeocomplete()
    @fireValidationWhenDateChanged()

  initInputMasks: ->
    $(":input").inputmask();

  initGeocomplete: ->
    $('#street-address')
      .geocomplete()
      .bind 'geocode:result', @geocodeResult

  geocodeResult: (event, result) =>
    address = result.address_components

    console.log address

    $('#user_jobseeker_profile_attributes_address_1').val "#{address[0].short_name} #{address[1].short_name}"
    $('#user_jobseeker_profile_attributes_city').val "#{address[3].short_name}"
    $('#user_jobseeker_profile_attributes_state').val "#{address[5].short_name}"
    $('#user_jobseeker_profile_attributes_county').val "#{address[4].short_name.slice(0, -7)}"
    $('#user_jobseeker_profile_attributes_zipcode').val "#{address[7].short_name}"

    $('#street-address').parent().hide()
    @App.Users.new.showAddressFields()

  hideAddressFields: ->
    $('.address-fields').hide()

  showAddressFields: ->
    $('.address-fields').show()

  fireValidationWhenDateChanged: ->
    $('[data-provide="datepicker"]').datepicker().on 'changeDate', (event) ->
      $(this).parsley().validate()

$ ->
  window.App.Users.new.init();
