<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

<style>
button.main-button1 {
    background-color: #eb5d1e;
    height: 70px;
    width: 235px;
    font-size: 24px;
    border: 0;
    border-radius: 100px;
    padding: 6px 41px;
    margin-top: 450px;
    margin-right: -305px;
    color: white;
}
</style>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row gy-4">
      <form name="frm-mbti1" id="frm-mbti1" method="post" action="<c:url value='/main/mbti/mbti'/>">
			<input type="hidden" name="questionTypeNo" value="1"/>
			<button type="submit" class="main-button1" id="mbti-free-button">검사하러 가기</button>
	  </form>
        <%-- <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h1>Bettter digital experience with Ninestars</h1>
          <h2>We are team of talented designers making websites with Bootstrap</h2>
          <div>
            <a href="#about" class="btn-get-started scrollto">Get Started</a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="${path }/assets/img/hero-img.svg" class="img-fluid animated" alt="">
        </div> --%>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

    <%-- <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row justify-content-between">
          <div class="col-lg-5 d-flex align-items-center justify-content-center about-img">
            <img src="${path }/assets/img/about-img.svg" class="img-fluid" alt="" data-aos="zoom-in">
          </div>
          <div class="col-lg-6 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">Voluptatem dignissimos provident quasi</h3>
            <p data-aos="fade-up" data-aos-delay="100">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
            </p>
            <div class="row">
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                <i class="bx bx-receipt"></i>
                <h4>Corporis voluptates sit</h4>
                <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
              </div>
              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <i class="bx bx-cube-alt"></i>
                <h4>Ullamco laboris nisi</h4>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Services</h2>
          <p>Check out the great services we offer</p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title"><a href="">Magni Dolores</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title"><a href="">Nemo Enim</a></h4>
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section --> --%>

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>What's your MBTI?</h2>
          <p>16가지 MBTI 유형을 만나보세요</p>
        </div>

        <!-- <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">App</li>
              <li data-filter=".filter-card">Card</li>
              <li data-filter=".filter-web">Web</li>
            </ul>
          </div>
        </div> -->

        <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ENFJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ENFJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ENFJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ENFJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ENFJ</h4>
                <p>선도자 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ENFP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ENFP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ENFP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ENFP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ENFP</h4>
                <p>활동가 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ENTJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ENTJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ENTJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ENTJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ENTJ</h4>
                <p>통솔자 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ENTP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ENTP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ENTP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ENTP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ENTP</h4>
                <p>변론가 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ESFJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ESFJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ESFJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ESFJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ESFJ</h4>
                <p>사교적인 외교관 유형ㄴ</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ESFP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ESFP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ESFP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ESFP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ESFP</h4>
                <p>연예인 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ESTJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ESTJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ESTJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ESTJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ESTJ</h4>
                <p>경영자 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ESTP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ESTP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ESTP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ESTP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ESTP</h4>
                <p>사업가 유형</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/INFJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/INFJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="INFJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=INFJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>INFJ</h4>
                <p>옹호자 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/INFP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/INFP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="INFP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=INFP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>INFP</h4>
                <p>중재자 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/INTJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/INTJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="INTJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=INTJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>INTJ</h4>
                <p>전략가 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/INTP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/INTP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="INTP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=INTP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>INTP</h4>
                <p>논리술사 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ISFJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ISFJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ISFJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ISFJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ISFJ</h4>
                <p>수호자 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ISFP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ISFP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ISFP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ISFP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ISFP</h4>
                <p>모험가 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ISTJ.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ISTJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ISTJ"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ISTJ" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ISTJ</h4>
                <p>현실주의자 유형</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path }/assets/img/portfolio/ISTP.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <a href="${path }/assets/img/portfolio/ISTP.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="ISTP"><i class="bi bi-plus"></i></a>
                <a href="/mbti/main/mbti/mbtiResult?mbtiType=ISTP" title="More Details"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <h4>ISTP</h4>
                <p>만능 재주꾼 유형</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>F.A.Q</h2>
          <p>Frequently Asked Questions</p>
        </div>

        <ul class="faq-list" data-aos="fade-up" data-aos-delay="100">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">Non consectetur a erat nam at lectus urna duis? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list">
              <p>
                Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq6" class="collapse" data-bs-parent=".faq-list">
              <p>
                Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section><!-- End F.A.Q Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Instructor</h2>
          <p>교육 강사</p>
        </div>

        <div class="row">

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="member">
              <img src="${path }/assets/img/team/na_1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>나다미</h4>
                  <span>Dami Na</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          
           <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="${path }/assets/img/team/hyun.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>황민현</h4>
                  <span>Minhyun Hwang</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>


          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="member">
              <img src="${path }/assets/img/team/mingi_1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김민기</h4>
                  <span>Mingi Kim</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="member">
              <img src="${path }/assets/img/team/suzy.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>배수지</h4>
                  <span>Suji Bae</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="${path }/assets/img/team/yong_1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>방용진</h4>
                  <span>Yongjin Bang</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
		  
		  <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="member">
              <img src="${path }/assets/img/team/jun_1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김영준</h4>
                  <span>Youngjun Kim</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="${path }/assets/img/team/in.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>설인아</h4>
                  <span>Inah Seol</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
			
			 <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="200">
            <div class="member">
              <img src="${path }/assets/img/team/min_1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>박정민</h4>
                  <span>Jeongmin Park</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          
        </div>

      </div>
    </section><!-- End Team Section -->

    <%-- <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Clients</h2>
          <p>They trusted us</p>
        </div>

        <div class="clients-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper align-items-center">
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-1.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-2.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-3.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-4.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-5.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-6.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-7.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide"><img src="${path }/assets/img/clients/client-8.png" class="img-fluid" alt=""></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Clients Section --> --%>

    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Head office location</h2>
          <p>강남 본사</p>
        </div>

        <div class="row">

          <div class="col-lg-12 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>주소:</h4>
                <p>서울특별시 서초구 서초대로77길 55 (에이프로스퀘어3층)</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>전화번호:</h4>
                <p>02-532-6509</p>
              </div>

			  <div id="map" style="width:100%;height:300px;"></div>
			  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2666b9d92b136acbf73b4b00a4f508ff&libraries=services,clusterer,drawing"></script>
			  <script type="text/javascript">
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.502034, 127.024520), // 지도의 중심좌표
			        level: 2 // 지도의 확대 레벨
			    };
		
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.502034, 127.024520); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				
				</script>
				
              <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe> -->
            </div>

          </div>

         <!--  <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name">Your Name</label>
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="form-group col-md-6 mt-3 mt-md-0">
                  <label for="name">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <label for="name">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <label for="name">Message</label>
                <textarea class="form-control" name="message" rows="10" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div>
        </div> -->
      </div>
  </section><!-- End Contact Us Section -->

  </main><!-- End #main -->


<%@ include file="inc/bottom.jsp" %>