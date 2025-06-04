const login_test = document.getElementById("show_link_0");
if (login_test){
  document.getElementById('logout_button').remove();
}else{
  document.getElementById('link_to_signin').remove();
  document.getElementById('link_to_login').innerHTML = 'ログイン済みです。';
}