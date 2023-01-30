$(function() {
  $('[name|=cust_type]').on('change', function() {
    if(this.value == 'company') {
      $('#company-name').removeClass('collapse');
      $('#trn').removeClass('collapse');
      $('#first-name').addClass('collapse');
      $('#last-name').addClass('collapse');

      $('#cname').attr('required', 'required');
      $('#trn-number').attr('required', 'required');
      $('#fname').removeAttr('required');
      $('#lname').removeAttr('required');
    }

    else {
      $('#company-name').addClass('collapse');
      $('#trn').addClass('collapse');
      $('#first-name').toggleClass('collapse');
      $('#last-name').toggleClass('collapse');

      $('#cname').removeAttr('required');
      $('#trn-number').removeAttr('required');
      $('#fname').attr('required', 'required');
      $('#lname').attr('required', 'required');
    }
  });

  $('[name|=pay_mthd]').on('change', function() {
    if(this.value == 'op') {
      $('#op-form').toggleClass('collapse');

      $('#account-name').attr('required', 'required');
      $('#account-num').attr('required', 'required');
      $('#cvv-cvc').attr('required', 'required');
      $('#account-expiry').attr('required', 'required');
    }

    else {
      if(!$('#op-form').hasClass('collapse'))
        $('#op-form').addClass('collapse');

        $('#account-name').removeAttr('required');
        $('#account-num').removeAttr('required');
        $('#cvv-cvc').removeAttr('required');
        $('#account-expiry').removeAttr('required');
    }
  });

  let cnty = $('#country');
  cnty.val('United Arab Emirates');

  cnty.on('change', function() {
    let dl= $("#countries")[0];
    $('#state').val('');
    $('#city').val('');
    $('#states').empty();
    $('#cities').empty();
    if(this.value.trim() != '') {
      let opSelected = dl.querySelector(`[value="${this.value}"]`);
      let id = opSelected.getAttribute('id');

      /* AJAX request for adding shopping list items to cart */
      $.ajax({
        type: 'get',
        url: '/states',
        data: {
          id: id,
        },
        success: function (resp) {
          if(resp == '') {
            $('#state-div').hide();
            $('#city-div').hide();
          }
          else {
            $('#state-div').show();
            $('#city-div').show();
            let stDl = $('#states')[0];
            resp.forEach((element) => {
              let option = document.createElement("option");
              option.value = element['name'];
              option.text = element['name'];
              option.setAttribute('id', element['id']);
              option.setAttribute('data-country', id);
              stDl.appendChild(option);
            });
          }
        },
        error: function () {
          alert("An error occured while accessing states")
        }
      });
    }
  });

  $('#state').on('change', function() {
    let dl= $("#states")[0];
    $('#city').val('');
    $('#cities').empty();
    if(this.value.trim() != ''){
      let opSelected = dl.querySelector(`[value="${this.value}"]`);
      let id = opSelected.getAttribute('data-country');
      let st_id = opSelected.getAttribute('id');

      /* AJAX request for adding shopping list items to cart */
      $.ajax({
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
              option.value = element['name'];
              option.text = element['name'];
              stDl.appendChild(option);
            });
          }
        },
        error: function () {
          alert("An error occured while accessing states")
        }
      });
    }
  });
  cnty.trigger('change');
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