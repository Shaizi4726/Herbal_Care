$(function() {
  let cnty = $('#country');
  cnty.val('United Arab Emirates');

  $('#country').on('change', function() {
    let dl= $("#countries")[0];
    $('#state').val('');
    $('#city').val('');
    $('#states').empty();
    $('#cities').empty();
    if(this.value.trim() != ''){
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