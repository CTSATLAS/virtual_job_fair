'use strict';

window.Admin = window.Admin || {}
window.Admin.Events = window.Admin.Events || {}

window.Admin.Events.new = {
  init() {
    this.initCalendar();
    this.initDaterangePicker();
    this.initModal();
    this.initSwitchery();
  },

  initCalendar() {
    $('#calendar').fullCalendar({
      defaultView: 'month',
      events: '/admin/events.json',
      handleWindowResize: true,
      header: {
          left: '',
          center: 'prev title next',
          right: ''
      },
      maxTime: '19:00:00',
      minTime: '08:00:00',
      slotDuration: '00:15:00',

      eventRender(event, $element) {
        const startsAt = event.start,
          endsAt = event.end,
          visibleStart = moment(event.visible_start),
          visibleEnd = moment(event.visible_end),
          titleText = $element.find('.fc-title').text();

        $element.on('click', () => {
          $('.modal-title').text(`Edit ${event.title}`);
          $('#event_id').val(event.id);
          $('#event_title').val(event.title);
          $('#event_specialty').val(event.specialty);
          $('#visibility-schedule').val(`${visibleStart.format('MM/DD/YYYY')} - ${visibleEnd.format('MM/DD/YYYY')}`);
          $('#event_visible_start').val(visibleStart);
          $('#event_visible_end').val(visibleEnd);
          $('#event-dates').val(`${startsAt.format('MM/DD/YYYY')} - ${endsAt.format('MM/DD/YYYY')}`);
          $('#event_starts_at').val(startsAt);
          $('#event_ends_at').val(endsAt);
          $('#addEvent .btn[type="submit"]').text('Save Event');

          if (event.allow_late_registration) {
            $('#event_allow_late_registration').trigger('click');
          }

          $('.modal-footer')
            .find('.btn-link')
            .show()

          $('#addEvent').modal('show');
        });

        $element.find('.fc-time').remove();
        $element
          .find('.fc-title')
          .html(`<strong>${titleText}</strong>&nbsp;&nbsp;<em style="color: #93deff; font-size: 12px">(Visible: ${visibleStart.format('MM/DD/YYYY')} &mdash; ${visibleEnd.format('MM/DD/YYYY')})</em>`);
      }
    });
  },

  initDaterangePicker() {
    const _this = this;

    $('[data-provides="daterangepicker"]')
      .daterangepicker({
        applyClass: 'btn-info',
        autoUpdateInput: false,
        locale: {
          cancelLabel: 'Clear',
          format: 'MM/DD/YYYY h:mm A'
        },
        minDate: moment().format('MM/DD/YYYY'),
        showCustomRangeLabel: false
      })
      .on('apply.daterangepicker', (event, picker) => {
        let startField = 'starts_at',
          endField = 'ends_at',
          startDate = picker.startDate.format('MM/DD/YYYY h:mm A'),
          endDate = picker.endDate.format('MM/DD/YYYY h:mm A');

        picker.element.val(`${startDate} - ${endDate}`);

        if (picker.element.prop('id') == 'visibility-schedule') {
          startField = 'visible_start';
          endField = 'visible_end';
        }

        $(`#event_${startField}`).val(picker.startDate.toISOString());
        $(`#event_${endField}`).val(picker.endDate.toISOString());

        _this._revalidateIfNeeded();
      })
      .on('cancel.daterangepicker', (event, picker) => picker.element.val(''));
  },

  initModal() {
    const _this = this;

    $('[data-open="modal"]').on('click', (event) => {
      $('.modal-title').text('New Event');

      $('.modal-footer')
        .find('.btn-link')
        .hide()
        .find('.btn[type="submit"]').text('Add Event');

      $('#addEvent').modal('show');
    });

    $('#addEvent').on('hidden.bs.modal', function (event) {
      const $modal = $(event.target);

      $modal.find('form').trigger('reset');
      _this._resetSwitchery();
    });
  },

  initSwitchery() {
    $('.js-switch').each(function() {
      new Switchery($(this)[0], $(this).data());
    });
  },

  _resetSwitchery() {
    $('input.js-switch').siblings().remove();
    new Switchery($('input.js-switch')[0], $('input.js-switch').data());
  },

  _revalidateIfNeeded() {
    const $newEventForm = $('#new_event').parsley();
    if ($newEventForm.validationResult == null) return;
    $newEventForm.validate();
  }
};

$(() => window.Admin.Events.new.init());
