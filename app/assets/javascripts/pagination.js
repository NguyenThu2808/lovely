$(document).on('turbolinks:load', function () {
  if ($('.pagination').length && $('.my-posts').length) {
    $(window).on('scroll', function(){
      more_posts_url = $('.pagination .next_page a').attr('href');
      if(more_posts_url) {
        more_posts_url = more_posts_url;
      } else {
        more_posts_url= $('.pagination .next a').attr('href');
      }
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." >');
        $.getScript(more_posts_url); // will load a JS script from the server and then execute it.
      }
    });
  }
});
