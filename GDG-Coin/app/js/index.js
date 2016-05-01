$(document).ready(function() {

  $("button.set").click(function() {
    var value = parseInt($("input.text").val(), 10);
    SimpleStorage.set(value);
    addToLog("SimpleStorage.set("+value+")");
  });

$("button.dobrar").click(function() {
    SimpleStorage.dobrar();
    addToLog("SimpleStorage.dobrar()");
  });

$("button.pegaend").click(function() {
    SimpleStorage.pegaend();
    addToLog("SimpleStorage.pegaend()");
  });

$("button.saldo").click(function() {
    SimpleStorage.saldo();
    addToLog("SimpleStorage.saldo()");
  });

  document.getElementsByClassName("get")[0].addEventListener('click', function() {
    var value = SimpleStorage.get().toNumber();
    $(".value").html(value);
    
  });

  var addToLog = function(txt) {
    $(".logs").append("<br>" + txt);
  };

});
