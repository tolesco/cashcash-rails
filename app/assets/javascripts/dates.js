$(function() {
  $('.single-date-picker-here').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    minYear: 1901,
    maxYear: parseInt(moment().format('YYYY'),10),
    locale: {
      format: 'DD/MM/YYYY'
    }
  });
});

$(function() {  
  $('.date-range-picker-here').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
  });  
  $('.date-range-picker-here').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
  });  
  $('.date-range-picker-here').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });  
});