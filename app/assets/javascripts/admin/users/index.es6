'use strict';

window.Admin = window.Admin || {}
window.Admin.Users = window.Admin.Users || {}

window.Admin.Users.new = {
  init() {
    this.initDatatables();
    this.initModal();
    this.initEvents();
  },
  
  initDatatables() {
    $('#users').DataTable({
      dom: 'Bfrtip',

      buttons: ['csvHtml5', 'excelHtml5'],

      columnDefs: [{
        targets: 2,
        searchable: false,
        sortable: false,
        width: '103px'
      }]      
    });
  },

  initModal() {
    const _this = this,
      $addUserBtn = $('#addUser');

    $('[data-open="users-modal"]').on('click', (event) => {
      event.preventDefault();

      $('.modal-title').text('New Administrator');

      $('#addUser form')
        .prop('action', '/admin/users')
        .find('input[name="_method"]').val('post');

      $('.modal-footer')
        .find('.btn[type="submit"]')
        .text('Add Administrator');

      $addUserBtn.modal('show');
    });

    $addUserBtn.on('hidden.bs.modal', (event) => {
      const $modalForm = $(event.target).find('form');

      $modalForm
        .trigger('reset')
        .parsley()
        .reset();
    });
  },

  initEvents() {
    $('.js-edit-user-link').on('click', function(event) {
      const $target = $(event.target)
        row = $target.parents('tr'),
        user_id = row.data('id');

      event.preventDefault();

      if ($target.parent().hasClass('disabled')) { return false; }

      $('.modal-title').text('Edit Administrator')
      $('#user_id').val(user_id);
      $('#user_first_name').val(row.data('first-name'));
      $('#user_last_name').val(row.data('last-name'));
      $('#user_email').val(row.data('email'));

      $('#addUser form')
        .prop('action', `/admin/users/${user_id}`)
        .find('input[name="_method"]').val('patch');

      $('.modal-footer')
        .find('.btn[type="submit"]')
        .text('Update Administrator')

      $('#addUser').modal('show');
    });
  }
};

$(document).on('turbolinks:load ready', () => {
  window.Admin.Users.new.init();
})
