$( document ).ready(function() {
    $('#text-table-of-contents ul').first().addClass('nav');
    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('body').scrollspy({target: '#table-of-contents'});
    $("#toc-toggle").click(function(e){
        e.preventDefault();
        $("#toc-wrapper").toggleClass("toggled");
    });
    $("a", "#table-of-contents").click(function(e){
        $("#toc-wrapper").toggleClass("toggled");
    });
});
