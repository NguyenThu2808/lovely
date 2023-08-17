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
