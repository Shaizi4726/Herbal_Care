$(function() {
  $('[name|=cust_type]').on('change', function() {
    if(this.value == 'company') {
      $('#company-name').removeClass('collapse');
      $('#trn').removeClass('collapse');
      $('#first-name').addClass('collapse');
      $('#last-name').addClass('collapse');
    }

    else {
      $('#company-name').addClass('collapse');
      $('#trn').addClass('collapse');
      $('#first-name').toggleClass('collapse');
      $('#last-name').toggleClass('collapse');
    }
  });

  $('[name|=pay_mthd]').on('change', function() {
    if(this.value == 'op') {
      $('#op-form').toggleClass('collapse');
      $('#cart-summary').css('max-height', '+=29.5em');
    }

    else {
      if(!$('#op-form').hasClass('collapse')) {
        $('#op-form').addClass('collapse');
        $('#cart-summary').css('max-height', '-=29.5em');
      }
    }
  });

  $('[name|=shipping-option]').on('change', function() {
    if(this.value == 'different') {
      $('#shipping-details').toggleClass('collapse');
      $('#cart-summary').css('max-height', '+=25em');
    }

    else {
      if(!$('#shipping-details').hasClass('collapse')) {
        $('#shipping-details').addClass('collapse');
        $('#cart-summary').css('max-height', '-=25em');
      }
    }
  });

  $('#country').val('United Arab Emirates');

  $('#country-div').on('click', function() {
    $('#countries').toggleClass('collapse');
  });

  $('#state-div').on('click', function() {
    $('#states').toggleClass('collapse');
      /* AJAX request for adding shopping list items to cart */
      /* $.ajax({
        type: 'get',
        url: '/cities',
        data: {
          id: id,
          st_id: st_id
        },
        success: function (resp) {
          if(resp == '') {
            $('#city-div').hide();
          }
          else {
            $('#city-div').show();
            let stDl = $('#cities')[0];
            resp.forEach((element) => {
              let option = document.createElement('option');
              option.value = element['id'];
              option.text = element['name'];
              stDl.appendChild(option);
            });
          }
        },
        error: function () {
          alert("An error occured while accessing states")
        }
      }); */
  });

  $('#city-div').on('click', function() {
    $('#cities').toggleClass('collapse');
  });

  cnty.trigger('change');

  $('#expiry-month').on('input', function(event) {
    if(isNaN(Number(this.value)) || this.value > 12) {
      this.value = this.value.slice(0, -1);
      return false;
    }

    if(this.value.length == 2)
      $('#expiry-year').focus();
  });

  $('#expiry-month').on('keypress', function(event) {
    if(this.value.length >= 2 || isNaN(Number(this.value))) {
      event.preventDefault();
      event.stopPropagation();
      return false;
    }
  });

  $('#expiry-year').on('input', function(event) {
    let date = new Date();
    if(isNaN(Number(this.value))) {
      this.value = this.value.slice(0, -1);
      return false;
    }
    
    if(this.value.length == 4) {
      if(this.value < date.getFullYear() || this.value > date.getFullYear() + 5) {
        this.placeholder = 'Invalid Year';
        this.value = '';
      }
      else
        $('#cvv-cvc').focus();
    }
  });

  $('#expiry-year').on('keypress', function(event) {
    if(this.value.length >= 4 || isNaN(Number(this.value))) {
      event.preventDefault();
      event.stopPropagation();
      return false;
    }
  });

  $('#order-form').on('submit', function() {
    let vale = $('#account-num').val();
    vale = vale.split(" ").join("");
    $('#account-num').val(vale);
  }) 
});

function cardNum(el, event) {
  let ws = $(el).val().split(" ").join("");
  
  if(isNaN(Number(ws)) || event.data == ' ')
    el.value = el.value.slice(0, -1);

  if(el.value.length >= 19)
    return false;

  if (ws.length > 0) {
    if(ws.length % 4 == 0) {
      el.value = el.value.trim();
      el.value += ' ';
    }
  }

  if(event.data == null) {
    el.value = el.value.trim();
  }
}

function cardLen(el, event) {
  let ws = $(el).val().split(" ").join("");

  if(el.value.length >= 19 || isNaN(Number(ws))) {
    event.preventDefault();
    event.stopPropagation();
    return false;
  }
}

function country(el, id) {
  $('#country-name').html($(el).html());
  $('#state-name').html('State');
  $('#state-name').css('color', '#727272');
  $('#states').html('');

  /* AJAX request for getting states for country */
  $.ajax({
    type: 'get',
    url: '/states',
    data: {
      id: id,
    },
    success: function (resp) {
      if(resp == '') {
        $('#state-form-group').hide();
        $('#city-form-group').hide();
      }
      else {
        $('#state-form-group').show();
        $('#city-form-group').show();
        let stDl = $('#states')[0];
        resp.forEach((element) => {
          let item = document.createElement("li");
          $(item).html(element['name']);
          item.setAttribute('id', 'state' + element['id']);
          item.setAttribute('data-state', element['id'])
          item.setAttribute('data-country', id);
          item.setAttribute('onclick', 'state(this)')
          stDl.appendChild(item);
        });
      }
    },
    error: function () {
      alert("An error occured while accessing states")
    }
  });
}

function state(el) {
  let id = $(el).attr('data-state');
  $('#state-name').html($(el).html());
  $('#state-name').css('color', '#000');
}