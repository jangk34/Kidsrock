<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Responsive Fullwidth website template</title>
      <link rel="stylesheet" href="/Resources/css/components.css">
      <link rel="stylesheet" href="/Resources/css/icons.css">
      <link rel="stylesheet" href="/Resources/css/responsee.css">
      <link rel="stylesheet" href="/Resources/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="/Resources/owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE -->
      <link rel="stylesheet" href="/Resources/css/template-style.css">
      <link rel="stylesheet" href="/Resources/img/header-1.jpg">
      <link rel="stylesheet" href="/Resources/img/header-2.jpg">
      <link rel="stylesheet" href="/Resources/img/header-3.jpg">
      <link rel="stylesheet" href="/Resources/img/logo.png">
      <script type="text/javascript" src="/assets/js/jquery-min.js"></script>
      <script src="/bootstrap-3.3.2-dist/js/jquery.form.min.js"></script>
      
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="/Resources/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="/Resources/js/jquery-ui.min.js"></script>    
   </head>
   <body style="width:100%">
   <div id="container"></div>
     
      <section class="slide-content">  
      
        <header>
        
          <!-- LOGO -->
          <nav>
            <div class="line">
               <div class="s-5 l-2 center">
                  <img class="full-img" src="/Resources/img/logo.png" "style=width:80%">
               </div>
            </div>
          </nav>
        </header>
         <!-- CAROUSEL --> 
           <div id="carousel">
              <div id="header-carousel" class="owl-carousel owl-theme">
                 <div class="item">
                    <img src="/Resources/img/header-1.jpg" alt="" style="width:100%">
                  
                 </div>
                 <div class="item">
                    <img src="/Resources/img/header-2.jpg" alt="">
                   
                 </div>
                 <div class="item">
                    <img src="/Resources/img/header-3.jpg" alt="" style="width:100%">
                
                 </div>
              </div>
           </div>
        <section class="text-center">
          
           <!-- FIRST BLOCK -->
           <div id="first-block" class="text-center">
              <div class="line">
                 <div class="margin">
                    <div class="s-12 m-6 l-3 margin-bottom">
                       <i class="icon-paperplane_ico icon3x"></i>
                       <h2 class="margin-bottom">About</h2>
                       <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                    </div>
                    <div class="s-12 m-6 l-3 margin-bottom">
                       <i class="icon-star icon3x"></i>
                       <h2 class="margin-bottom">Company</h2>
                       <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                    </div>
                    <div class="s-12 m-6 l-3 margin-bottom">
                       <i class="icon-message icon3x"></i>
                       <h2 class="margin-bottom">Services</h2>
                       <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                    </div>
                    <div class="s-12 m-6 l-3 margin-bottom">
                       <i class="icon-mail icon3x"></i>
                       <h2 class="margin-bottom">Contact</h2>
                       <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                    </div>
                 </div>
              </div>
           </div>
          
        </section>
        <!-- FOOTER -->
        <footer>
           <div class="line">
              <div class="s-12 l-6">
                 <p>Copyright 2018, Vision Design - graphic zoo</p>
              </div>
              <div class="s-12 l-6">
                 <a class="right" href="http://www.myresponsee.com" title="Responsee - lightweight responsive framework">Design and coding by Responsee Team</a>
              </div>
           </div>
        </footer>
      </section>
      <script type="text/javascript" src="/Resources/js/responsee.js"></script>
      <script type="text/javascript" src="/Resources/owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript">
        jQuery(document).ready(function($) {
          var owl = $('#header-carousel');
          owl.owlCarousel({
            nav: false,
            dots: true,
            items: 1,
            loop: true,
            navText: ["&#xf007","&#xf006"],
            autoplay: true,
            autoplayTimeout: 3000
          });
          var owl = $('#news-carousel');
          owl.owlCarousel({
            nav: false,
            dots: true,
            items: 1,
            loop: true,
            navText: ["&#xf007","&#xf006"],
            autoplay: true,
            autoplayTimeout: 3000
          });
        })
      </script>
      </div>
   </body>
</html>