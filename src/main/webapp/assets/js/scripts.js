
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        if(username == '') {
            $(this).find('div.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('div.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
        if(password == '') {
            $(this).find('div.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('div.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
    });

    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('div.error').fadeOut('fast');
    });

});
