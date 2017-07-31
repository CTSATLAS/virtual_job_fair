$(document).on('click', '.file-input-browse', function() {
  $(this).parents('.form-group')
         .find('.file-input')
         .trigger('click');
});

$(document).on('change', '.file-input', function() {
  let parsedInputValue = $(this).val().replace(/C:\\fakepath\\/i, ''),
    fileExtension = parsedInputValue.slice(parsedInputValue.indexOf('.')),
    $fileInputIcon = $('.file-input-icon');

  if (parsedInputValue.length > 50) {
    parsedInputValue = parsedInputValue.slice(0, 50).concat('...');
  }

  switch(fileExtension) {
    case '.doc':
    case '.docx':
      $fileInputIcon.removeClass('fa-file-pdf-o');
      $fileInputIcon.addClass('fa-file-word-o');
      break;

    case '.pdf':
      $fileInputIcon.removeClass('fa-file-word-o');
      $fileInputIcon.addClass('fa-file-pdf-o');
      break;
  }

  $(this).parent()
         .find('.file-input-filename')
         .text(parsedInputValue);

  $('.file-input-file-exists').show();
});
