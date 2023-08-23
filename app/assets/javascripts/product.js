$('.btn-add-to-cart').on('click', function(e) {
  e.preventDefault();
  let color = $('.color-product').val();
  // let size = $('.size-product').val();
  let quantity = $('.touchspin-cart').val();
  let slug_arr = $('.url_page').val().split('/');
  let slug = slug_arr[slug_arr.length-1];

  $.ajax({
    url: "/cart_items",
    type: "POST",
    dataType: 'script',
    data: { quantity, color, slug },
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
  });
});

$('.remove-wishlist').on('click', function(e) {
  e.preventDefault();
  let id = $(this).data("id");
  let button = $(this);

  $.ajax({
    url: `/cart_items/${id}`,
    type: "DELETE",
    dataType: 'script',
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
    complete: function () {
      button.closest('.ecommerce-card.card').remove();
    }
  });
});

// $(document).on('click', '.bootstrap-touchspin-up', function(e) {
//   debugger
//   e.preventDefault();
//   let parent = $(this).parent().parent();
//   // ('.bootstrap-touchspin')
//   let quantity = parseInt(parent.find('.touchspin-cart').val());
//   parent.find('.touchspin-cart').value = quantity;
// });

// $(document).on('click', '.bootstrap-touchspin-down', function(e) {
//   debugger
//   let parent = $(this).closest('.bootstrap-touchspin');
//   let quantity = parseInt(parent.find('.touchspin-cart').val()) - 1;
//   parent.find('.touchspin-cart').val(quantity);
// });


$('.step-trigger, .place-order').on('click', function() {
  let cart_ids = $('#cart_ids').val();

  $.ajax({
    url: '/set_session_cart',
    type: 'POST',
    dataType: 'script', //html, json
    data: {cart_ids},
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
  });
});

$('.delivery-address').on('click', function() {
  let fullname = $('#checkout-name').val();
  let mobile_number = $('#checkout-number').val();
  let city = $('#checkout-city').val();
  let postcode = $('#checkout-pincode').val();

  $.ajax({
    url: '/set_session_address',
    type: 'POST',
    dataType: 'json', //html, json
    data: {fullname, mobile_number, city, postcode},
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
    complete: function(data) {
      $('.card-holder-name').text(data.responseJSON.fullname);
    }
  });
});
