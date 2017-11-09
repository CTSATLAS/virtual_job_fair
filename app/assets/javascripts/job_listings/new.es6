'use strict';

window.App = window.App || {};
window.App.JobListings = window.App.JobListings || {};

window.App.JobListings.new = {
  init() {
    this.initSelectize();
  },

  initSelectize() {
    $('#job_listing_license_requirements').selectize({
      labelField: 'name',
      maxItems: null,
      persist: false,
      searchField: ['name'],
      valueField: 'value',

      options: [{
        name: 'Florida License',
        value: 'Florida License'
      }, {
        name: 'CDL',
        value: 'CDL'
      }, {
        name: 'A',
        value: 'A'
      }, {
        name: 'B',
        value: 'B'
      }, {
        name: 'C',
        value: 'C'
      }, {
        name: 'E',
        value: 'E'
      }]
    });

    $('#job_listing_education_requirements').selectize({
      labelField: 'name',
      maxItems: null,
      persist: false,
      searchField: ['name'],
      valueField: 'value',

      options: [{
        name: 'None',
        value: 'None'
      }, {
        name: 'High School Diploma or GED',
        value: 'High School Diploma or GED'
      }, {
        name: 'AA/AS',
        value: 'AA/AS'
      }, {
        name: 'BA/BS',
        value: 'BA/BS'
      }, {
        name: 'MA/MS',
        value: 'MA/MS'
      }]
    });
  },

  revalidateIfNeeded() {
    const $newUserFormValidation = $('#new_user').parsley();
    if ($newUserFormValidation.validationResult == null) return;
    $newUserFormValidation.validate();
  }
};

$(function() {
  window.App.JobListings.new.init();
});
