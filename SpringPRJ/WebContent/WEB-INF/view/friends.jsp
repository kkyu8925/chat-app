<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Friends</title>
  </head>
  <body>

    <header class="screen-header" style="padding-bottom: 5px;">
      <h1 class="screen-header__title">Friends</h1>
      <div class="screen-header__icons">
        <span><i class="fas fa-search fa-lg"></i></span>
        <span
          ><a href="/settings.do"><i class="fas fa-cog fa-lg"></i></a
        ></span>
      </div>
    </header>

    <main class="friends-screen">

      <div class="friends-screen__channel">
        <div class="user-component">
          <div class="user-component__column">
            <img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>
            <div class="user-component__text">
              <h4 class="user-component__title user-component__title--not-bold">
                kkyu
              </h4>
            </div>
          </div>
          <div class="user-component__column">
          </div>
        </div>
      </div>
      
      <div class="friends-screen__channel">
        <div class="user-component">
          <div class="user-component__column">
            <img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>
            <div class="user-component__text">
              <h4 class="user-component__title user-component__title--not-bold">
                woo
              </h4>
            </div>
          </div>
          <div class="user-component__column">
          </div>
        </div>
      </div>
      
      <div class="friends-screen__channel">
        <div class="user-component">
          <div class="user-component__column">
            <img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>
            <div class="user-component__text">
              <h4 class="user-component__title user-component__title--not-bold">
                min
              </h4>
            </div>
          </div>
          <div class="user-component__column">
          </div>
        </div>
      </div>
      
      <div class="friends-screen__channel">
        <div class="user-component">
          <div class="user-component__column">
            <img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>
            <div class="user-component__text">
              <h4 class="user-component__title user-component__title--not-bold">
                hong
              </h4>
            </div>
          </div>
          <div class="user-component__column">
          </div>
        </div>
      </div>
    </main>
    
    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="/friends.do">
            <i class="fas fa-user fa-2x"></i>
          </a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="/chat.do">
            <i class="far fa-comment fa-2x"></i>
          </a>
        </li>
      </ul>
    </nav>
    <div id="splash-screen">
      <i class="fas fa-comment"></i>
    </div>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
