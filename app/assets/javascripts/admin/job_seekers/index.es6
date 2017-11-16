'use strict';

window.Admin = window.Admin || {}
window.Admin.JobSeekers = window.Admin.JobSeekers || {}

window.Admin.JobSeekers.new = {
  init() {
    this.initDatatables();
  },
  
  initDatatables() {
    $('#job_seekers').DataTable({
      dom: 'Bfrtip',

      buttons: [{
        extend: 'csvHtml5',
        exportOptions: {
          columns: [0, 1, 2, 4]
        }
      }, {
        extend: 'excelHtml5',
        exportOptions: {
          columns: [0, 1, 2, 4]
        }
      }],

      columnDefs: [{
        targets: 1,
        sortable: false
      }, {
        targets: 2,
        sortable: false
      }, {
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

$(document).on('turbolinks:load', () => window.Admin.JobSeekers.new.init());
