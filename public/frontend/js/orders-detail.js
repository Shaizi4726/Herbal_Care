$('.order-data').on('click', function() {
  let order = $(this).attr('data-order');
  window.location.href = "/order-data?id=" + order;
});

$('#order-data').on('click', function() {
  let order = $('#order-id-input').val().toUpperCase();
  window.location.href = "/order-data?id=" + order;
});

$('#all-checkbox').on('change', function() {
  if(this.checked) {
    $('.item-checkbox').prop('checked', true);
    if($('#cancel'))
      $('#cancel').removeAttr('disabled');
    if($('#return'))
      $('#return').removeAttr('disabled');
  }
  else {
    $('.item-checkbox').prop('checked', false);
    if($('#cancel'))
      $('#cancel').attr('disabled', true);
    if($('#return'))
      $('#return').attr('disabled', true);
  }
});

$('.item-checkbox').on('change', function() {
  if(! this.checked) {
    $('#all-checkbox').prop('checked', false);
  } else {
    if($('#cancel'))
      $('#cancel').removeAttr('disabled');
    if($('#return'))
      $('#return').removeAttr('disabled');
  }

  if($('.item-checkbox:checked').length == $('.item-checkbox').length)
    $('#all-checkbox').prop('checked', true);

  if($('.item-checkbox:not(:checked)').length == $('.item-checkbox').length) {
    if($('#cancel'))
      $('#cancel').attr('disabled', true);
    if($('#return'))
      $('#return').attr('disabled', true);
  }
});

if($('#cancel')) {
  $('#cancel').on('click', function() {
    let order_id = $('#order').val();
    let all = 0;
    let items = new Array();

    if($('#all-checkbox').prop('checked')) {
      all = 1;
    }
    else {
      $('input:checkbox[name=item_checkbox]:checked').each(function() {
        items.push($(this).val());
      });
    }

    /* AJAX request to cancel items from order */
    $.ajax({
      type: 'get',
      url: '/order-cancel',
      data: {
        id: order_id,
        all: all,
        items: items
      },
      success: function(response) {
        location.reload();
      },
      error: function() {
        alert("An error occured while cancel operation");
      }                
    }); 
  });
}

if($('#return')) {
  $('#return').on('click', function() {
    let order_id = $('#order').val();
    let all = 0;
    let items = new Array();

    if($('#all-checkbox').prop('checked')) {
      all = 1;
    }
    else {
      $('input:checkbox[name=item_checkbox]:checked').each(function() {
        items.push($(this).val());
      });
    }

    /* AJAX request to cancel items from order */
    $.ajax({
      type: 'get',
      url: '/order-return',
      data: {
        id: order_id,
        all: all,
        items: items
      },
      success: function(response) {
        location.reload();
      },
      error: function() {
        alert("An error occured while cancel operation");
      }                
    }); 
  });
}