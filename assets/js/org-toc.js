$( document ).ready(function() {
    $('#text-table-of-contents ul').first().addClass('nav');
    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('body').scrollspy({target: '#table-of-contents', offset:90 });
    $("h2", "#table-of-contents").wrapInner('<a  /a>');
    $("#toc-toggle").click(function(e){
        e.preventDefault();
        $("#toc-wrapper").toggleClass("toggled");
        $("#toc-toggle").toggleClass("toggled");
    });
    $("a", "#table-of-contents").click(function(){
        $("#toc-wrapper").toggleClass("toggled");
        $("#toc-toggle").toggleClass("toggled");
    });
});
