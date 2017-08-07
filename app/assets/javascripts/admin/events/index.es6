'use strict';

window.Admin = window.Admin || {}
window.Admin.Events = window.Admin.Events || {}

window.Admin.Events.new = {
  init() {
    this.initCalendar();
    this.initDaterangePicker();
  },

  initCalendar() {
    $('#calendar').fullCalendar({
      slotDuration: '00:15:00',
      minTime: '08:00:00',
      maxTime: '19:00:00',
      defaultView: 'month',
      handleWindowResize: true,
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month'
      },
      events: [{
        id: 1,
        url: '/admin/events/test',
        title: 'Youth Job Fair (visible from 01/01/2001 - 01/10/2001)',
        start: new Date($.now() + 506800000),
        allDay: true,
        className: 'bg-info',
        editable: true
      }]
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
        showCustomRangeLabel: false,
        timePicker: true,
        timePickerIncrement: 30
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

        $(`#event_${startField}`).val(startDate);
        $(`#event_${endField}`).val(endDate);

        _this._revalidateIfNeeded();
      })
      .on('cancel.daterangepicker', (event, picker) => picker.element.val(''));
  },

  _revalidateIfNeeded() {
    const $newEventForm = $('#new_event').parsley();
    if ($newEventForm.validationResult == null) return;
    $newEventForm.validate();
  }
};

$(() => window.Admin.Events.new.init());
