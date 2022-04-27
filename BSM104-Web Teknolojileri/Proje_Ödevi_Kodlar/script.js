//iletisim.html
function control() {
    var name = document.forms["Form"]["name"].value;
    if (name == "") {
        alert("İsim boş bırakılamaz");
        return false;
    }

    var email = document.forms["Form"]["email"].value;
    if (email == "") {
        alert("Mail Kısmı Boş bırakılamaz");
        return false;
    }

    var forMail = /^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+.)+([.])+[a-zA-Z0-9.-]{2,4}$/;
    if (forMail.test(email) == false) {
        alert("Geçersiz Mail Adresi!!!");
        return false;
    }
    var message = document.forms["Form"]["message"].value;
    if (message == "") {
        alert("Mesaj Kısmı Boş bırakılamaz");
        return false;
    }

}

//iletisimGoruntule.html
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
var name = getParameterByName('name');
var email = getParameterByName('email');
var city = getParameterByName('city');
var gender = getParameterByName('gender');
var message = getParameterByName('message');

//mesajin karakter sayisini kontrol ettim
function checkChar()
{
 var allowedChar=400;
 var content= document.getElementById("message");
 var contLength=content.value.length;
	
 if(contLength > allowedChar){
  content.value=content.value.substring(0,allowedChar);
  document.getElementById("uyari").innerHTML="<span style='color:red;'>UYARI: En fazla "+allowedChar+" karakter girebilirsiniz</span>";
 }	
}

//.yukarikaydir
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.yukarikaydir').fadeIn();
        } else {
            $('.yukarikaydir').fadeOut();
        }
    });

    $('.yukarikaydir').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 1000);
        return false;
    });
});


