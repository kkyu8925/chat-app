<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings</title>
  </head>
  <body>
    

    <header class="alt-header">
      <div class="alt-header__column">
        <a href="/friends.do">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">Settings</h1>
      </div>
      <div class="alt-header__column">
        <span><i class="fas fa-search fa-lg" style="cursor:pointer"></i></span>
      </div>
    </header>

    <main class="main-screen">
      <ul class="settings-list">
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-bullhorn"></i>
            <span>Notices</span>
          </div>
          <div class="settings__setting-column"></div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-flask"></i>
            <span>Kokoa Lab</span>
          </div>
          <div class="settings__setting-column"></div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-info-circle"></i>
            <span>Version</span>
          </div>
          <div class="settings__setting-column">Latest Version</div>
        </li>
      </ul>
    </main>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
