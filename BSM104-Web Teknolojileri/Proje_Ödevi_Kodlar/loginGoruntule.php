<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="Görseller/favicon1.png">
    <link rel="stylesheet" href="Bootstrap/bootstrap.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
	
    <title>
        <?php 

            include("kullanici.php");

                if (($_POST["email"] == $user) and ($_POST["password"] == $pass)){
                    $_SESSION["login"] = "true";
                    $_SESSION["user"] = $user;
                    $_SESSION["pass"] = $pass;
                    $_SESSION["name"]=$name;

                    echo("Hoşgeldiniz!");

                }

                else{
                   echo "Tekrar Deneyiniz!";                       
                }

        ?>      
    </title>

</head>

<body>
    <nav class="navbar navbar-expand-lg sticky-top pr-3">
        <a href="index.html" class="navbar-brand">
            <img src="Görseller/anaSayfaGorsel.png" alt="Resim bulunamadi!">
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-icon"><img class="bars" src="Görseller/navbarIcon.png" alt=""></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end " id="collapsibleNavbar">
            <ul class=" navbar-nav">
                <a href="index.html" class="nav-link">Anasayfa</a>
                <a href="ozgecmis.html" class="nav-link">Özgeçmiş</a>
                <a href="sehrim.html" class="nav-link">Şehrim</a>
                <a href="sakaryaspor.html" class="nav-link">Sakaryaspor</a>
                <a href="ilgiAlanlarim.html" class="nav-link">İlgi Alanlarım</a>
                <a href="iletisim.html" class="nav-link">İletişim</a>
                <a href="login.html" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
            </ul>
        </div>
    </nav>
		
	<div class="container mt-5 w-50 text-center p-5">
	
			<?php 

				include("kullanici.php");


				if (($_POST["email"] == $user) and ($_POST["password"] == $pass)){
			       $_SESSION["login"] = "true";
			       $_SESSION["user"] = $user;
			       $_SESSION["pass"] = $pass;
                   $_SESSION["name"]=$name;
			
			       echo("$name, <br> <br> Hoşgeldiniz!");                  
                   header("Refresh: 2; url=index.html");
                   
				}
			
				else{
			        echo "Kullancı Adı veya Şifre Yanlış.<br> <br>";
			        echo "!!!TEKRAR DENEYİN!!!";
			        header("Refresh: 2; url=login.html");
			    }
			
			?>
			
    </div>
    
    <a href="#" class="yukarikaydir"><i class="fa fa-2x fa-arrow-up"></i></a>

	<footer class="mt-5 p-3 text-white footer-All-Page ">
        <div class="row">
            <div class="col-sm-2 text-center">
                <a href="index.html"><img style="width: 4rem;" src="Görseller/anaSayfaGorsel.png"
                        alt="Resim bulunamadi!"></a>
            </div>
            <div class="col-sm-7 my-4 text-center font-weight-bold"> © 2021, Bu Sitenin Tüm Hakları Saklıdır</div>
            <div class="col-sm my-4 text-center">
                    <a href="https://www.instagram.com/emreaknci/" target="_blank"><i class="fab fa-instagram"> Instagram
                            </i>
                    </a>
                    <a href="https://www.linkedin.com/in/yunus-emre-akinci-00b37b1ab/" target="_blank"><i
                            class="fab fa-linkedin"> Linkedln</i> </a>
                    <a href="https://github.com/emreaknci" target="_blank"><i class="fab fa-github"> Github</i> </a>
            </div>
        </div>
    </footer>

	<script src="Bootstrap/jquery-3.5.1.js"></script>
    <script src="Bootstrap/bootstrap.bundle.js"></script>
    <script src="script.js"></script>

</body>

</html>