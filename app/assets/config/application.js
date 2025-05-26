console.log("start");

// ログインしてるか確認
const test = document.getElementById("show_link_0");

if (test){

  // headerを変更
  document.getElementById("show_link_0").remove();
  document.getElementById("a_make").remove();
  document.getElementById("a_edit").remove();

  const a_login = document.createElement("a");
  a_login.href = "/users/sign_in";
  a_login.textContent = "Login";
  a_login.className = "nav-link";

  const a_signin = document.createElement("a");
  a_signin.href = "/users/sign_up";
  a_signin.textContent = "Signin";
  a_signin.className = "nav-link";

  document.getElementById("make_link_0").appendChild(a_login);
  document.getElementById("edit_link_0").appendChild(a_signin);
} else {
  console.log("ログインしています。");
}

// methodを設定
let method;

// showアクションの設定
document.getElementById("a_show").onclick = function() {
  method = show;
  
};

// makeアクションの設定
document.getElementById("a_make").onclick = function() {
  method = make;
};

// editアクションの設定
document.getElementById("a_edit").onclick = function() {
  method = edit;
};