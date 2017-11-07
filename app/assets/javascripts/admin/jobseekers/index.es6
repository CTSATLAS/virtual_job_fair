'use strict';

window.Admin = window.Admin || {}
window.Admin.Jobseekers = window.Admin.Jobseekers || {}

window.Admin.Jobseekers.new = {
  init() {
    this.initDatatables();
  },
  
  initDatatables() {
    $('#jobseekers').DataTable({
      dom: 'Bfrtip',

      buttons: ['csvHtml5', 'excelHtml5'],

      columnDefs: [{
        targets: 3,
        searchable: false,
        sortable: false
      }, {
        targets: 5,
        searchable: false,
        sortable: false,
        width: '103px'
      }]
    });
  }
};

$(document).on('turbolinks:load ready', () => {
  window.Admin.Jobseekers.new.init();
})
