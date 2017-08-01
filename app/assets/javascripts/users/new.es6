'use strict';

window.App = window.App || {};
window.App.Users = window.App.Users || {};

window.App.Users.new = {
  init() {
    this.initInputMasks();
    this.initSelectize();
    this.initGeocomplete();
  },

  initInputMasks() {
    $(':input').inputmask();
  },

  initSelectize() {
    $('[data-provide="selectize"]').selectize({
      delimiter: ',',
      persist: false,
      create: input => ({ value: input, text: input })
    });
  },

  initGeocomplete() {
    if (typeof google == 'undefined') return;

    this.hideAddressFields();

    $('#street-address')
      .geocomplete()
      .on('geocode:result', this.geocodeResult);
  },

  geocodeResult(event, result) {
    const address = result.address_components,
      street_number = _.find(address, (result) => result.types[0] == 'street_number'),
      route = _.find(address, (result) => result.types[0] == 'route'),
      city = _.find(address, (result) => result.types[0] == 'locality'),
      county = _.find(address, (result) => result.types[0] == 'administrative_area_level_2'),
      state = _.find(address, (result) => result.types[0] == 'administrative_area_level_1'),
      zipcode = _.find(address, (result) => result.types[0] == 'postal_code'),
      account_type = $('#user_account_type').val();

    $(`#user_${ account_type }_profile_attributes_address_1`).val(`${ street_number.short_name } ${ route.short_name }`);
    $(`#user_${ account_type }_profile_attributes_city`).val(`${ city.short_name  }`);
    $(`#user_${ account_type }_profile_attributes_state`).val(`${ state.short_name  }`);
    $(`#user_${ account_type }_profile_attributes_county`).val(`${ county.short_name.slice(0, -7)  }`);
    $(`#user_${ account_type }_profile_attributes_zipcode`).val(`${ zipcode.short_name  }`);

    window.App.Users.new.showAddressFields();
    $(event.target)
      .parent()
      .hide();
  },

  typePrefix(string, account_type) {
    const prefix = $('#user_account_type').val();
    return string[0] + prefix + string[1];
  },

  showGeocompleteField() {
    $('#street-address').show();
  },

  hideAddressFields() {
    $('.address-fields').hide();
  },

  showAddressFields() {
    $('.address-fields').show();
  }
};

$(function() {
  window.App.Users.new.init();
});
