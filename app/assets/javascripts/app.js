
$(function() {
    if (!$('#reset-form').length) {
        return false;
    }

    var resetValidationSettings = {
        rules: {
            email1: {
                required: true,
                email: true
            }
        },
        messages: {
            email1: {
                required: "Please enter email address",
                email: "Please enter a valid email address"
            }
        },
        invalidHandler: function() {
            animate({
                name: 'shake',
                selector: '.auth-container > .card'
            });
        }
    }

    $.extend(resetValidationSettings, config.validations);

    $('#reset-form').validate(resetValidationSettings);
})
//LoginForm validation
$(function() {
    if (!$('#login-form').length) {
        return false;
    }

    var loginValidationSettings = {
        rules: {
            username: {
                required: true,
                email: true
            },
            password: "required",
            agree: "required"
        },
        messages: {
            username: {
                required: "Please enter username",
                email: "Please enter a valid email address"
            },
            password:  "Please enter password",
            agree: "Please accept our policy"
        },
        invalidHandler: function() {
            animate({
                name: 'shake',
                selector: '.auth-container > .card'
            });
        }
    }

    $.extend(loginValidationSettings, config.validations);

    $('#login-form').validate(loginValidationSettings);
})
//SignupForm validation
$(function() {
    if (!$('#signup-form').length) {
        return false;
    }

    var signupValidationSettings = {
        rules: {
            firstname: {
                required: true,
            },
            lastname: {
                required: true,
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 8
            },
            retype_password: {
                required: true,
                minlength: 8,
                equalTo: "#password"
            },
            agree: {
                required: true,
            }
        },
        groups: {
            name: "firstname lastname",
            pass: "password retype_password",
        },
        errorPlacement: function(error, element) {
            if (
                element.attr("name") == "firstname" || 
                element.attr("name") == "lastname" 
            ) {
                error.insertAfter($("#lastname").closest('.row'));
                element.parents("div.form-group")
                .addClass('has-error');
            } 
            else if (
                element.attr("name") == "password" || 
                element.attr("name") == "retype_password" 
            ) {
                error.insertAfter($("#retype_password").closest('.row'));
                element.parents("div.form-group")
                .addClass('has-error');
            }
            else if (element.attr("name") == "agree") {
                error.insertAfter("#agree-text");
            }
            else {
                error.insertAfter(element);
            }
        },
        messages: {
            firstname: "Please enter firstname and lastname",
            lastname: "Please enter firstname and lastname",
            email: {
                required: "Please enter email",
                email: "Please enter a valid email address"
            },
            password: {
                required: "Please enter password fields.",
                minlength: "Passwords should be at least 8 characters."
            },
            retype_password: {
                required: "Please enter password fields.",
                minlength: "Passwords should be at least 8 characters."
            },
            agree: "Please accept our policy"
        },
        invalidHandler: function() {
            animate({
                name: 'shake',
                selector: '.auth-container > .card'
            });
        }
    }

    $.extend(signupValidationSettings, config.validations);

    $('#signup-form').validate(signupValidationSettings);
});
/***********************************************
*        Animation Settings
***********************************************/
function animate(options) {
    var animationName = "animated " + options.name;
    var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
    $(options.selector)
    .addClass(animationName)
    .one(animationEnd, 
        function(){
            $(this).removeClass(animationName);
        }
    );
}

$(function() {
    var $itemActions = $(".item-actions-dropdown");

    $(document).on('click',function(e) {
        if (!$(e.target).closest('.item-actions-dropdown').length) {
            $itemActions.removeClass('active');
        }
    });
    
    $('.item-actions-toggle-btn').on('click',function(e){
        e.preventDefault();

        var $thisActionList = $(this).closest('.item-actions-dropdown');

        $itemActions.not($thisActionList).removeClass('active');

        $thisActionList.toggleClass('active');  
    });
});

/***********************************************
*        NProgress Settings
***********************************************/
// var npSettings = { 
//  easing: 'ease', 
//  speed: 500 
// }

// NProgress.configure(npSettings);
// $(function() {
//  setSameHeights();

//  var resizeTimer;

//  $(window).resize(function() {
//      clearTimeout(resizeTimer);
//         resizeTimer = setTimeout(setSameHeights, 150);
//  });
// });


function setSameHeights($container) {

    $container = $container || $('.sameheight-container');

    var viewport = ResponsiveBootstrapToolkit.current();

    $container.each(function() {

        var $items = $(this).find(".sameheight-item");

        // Get max height of items in container
        var maxHeight = 0;

        $items.each(function() {
            $(this).css({height: 'auto'});
            maxHeight = Math.max(maxHeight, $(this).innerHeight());
        });


        // Set heights of items
        $items.each(function() {
            // Ignored viewports for item
            var excludedStr = $(this).data('exclude') || '';
            var excluded = excludedStr.split(',');

            // Set height of element if it's not excluded on 
            if (excluded.indexOf(viewport) === -1) {
                $(this).innerHeight(maxHeight);
            }
        });
    });
}






//LoginForm validation
$(function() {
    if (!$('.form-control').length) {
        return false;
    }

    $('.form-control').focus(function() {
        $(this).siblings('.input-group-addon').addClass('focus');
    });

    $('.form-control').blur(function() {
        $(this).siblings('.input-group-addon').removeClass('focus');
    });
});
$(function(){

    // set sortable options
    $('.images-container').sortable({
        animation: 150,
        handle: ".control-btn.move",
        draggable: ".image-container",
        onMove: function (evt) {
            var $relatedElem = $(evt.related);

            if ($relatedElem.hasClass('add-image')) {
                return false;
            }
        }
    });


    $controlsButtons = $('.controls');

    $controlsButtonsStar = $controlsButtons.find('.star');
    $controlsButtonsRemove = $controlsButtons.find('.remove');

    $controlsButtonsStar.on('click',function(e){
        e.preventDefault();

        $controlsButtonsStar.removeClass('active');
        $controlsButtonsStar.parents('.image-container').removeClass('main');

        $(this).addClass('active');

        $(this).parents('.image-container').addClass('main');
    })

})

$(function() {

    $(".wyswyg").each(function() {

        var $toolbar = $(this).find(".toolbar");
        var $editor = $(this).find(".editor");


        var editor = new Quill($editor.get(0), {
            theme: 'snow'
        });

        editor.addModule('toolbar', {
            container: $toolbar.get(0)     // Selector for toolbar container
        });



    });
    
});
$(function () {

    $('#sidebar-menu, #customize-menu').metisMenu({
        activeClass: 'open'
    });


    $('#sidebar-collapse-btn').on('click', function(event){
        event.preventDefault();
        
        $("#app").toggleClass("sidebar-open");
    });

    $("#sidebar-overlay").on('click', function() {
        $("#app").removeClass("sidebar-open");
    });
    
});
$(function() {
    $('.nav-profile > li > a').on('click', function() {
        var $el = $(this).next();

        animate({
            name: 'flipInX',
            selector: $el
        });
    });
})
var modalMedia = {
    $el: $("#modal-media"),
    result: {},
    options: {},
    open: function(options) {
        options = options || {};
        this.options = options;


        this.$el.modal('show');
    },
    close: function() {
        if ($.isFunction(this.options.beforeClose)) {
            this.options.beforeClose(this.result);
        }

        this.$el.modal('hide');

        if ($.isFunction(this.options.afterClose)) {
            this.options.beforeClose(this.result);
        }
    }
};

$(function() {

    $("body").addClass("loaded");

});

