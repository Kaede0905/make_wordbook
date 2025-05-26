console.log('play');

// scoreの初期化
let score = 0;
// 回答数を初期化
let num = 0;
// 問題数を初期化
let total_amount
// viewからの情報受け取り
document.querySelectorAll(".check-answer").forEach(button => {
  button.addEventListener("click",function(){
    const wordId = this.getAttribute("data-id");
    const answerInput =document.getElementById("english_answer_" + wordId).value;

    console.log("クリックされました！"); // デバッグ用
    console.log("wordId:", wordId); // IDが正しく取得できているか確認
    console.log("answerInput:", answerInput); // 入力値が取得できているか確認

// checkコントローラーに送信
    fetch(`/words/check/${wordId}`,{
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ answer: answerInput })
    })

// checkコントローラーから情報受け取り
    .then(response => response.json())
    .then(document.getElementById("english_answer_" + wordId).remove())
    .then(document.getElementById("english_button_" + wordId).remove())
    .then(data => {document.getElementById("result_" + wordId).innerHTML = data.message; 
      score += data.score;
      num += data.num;
      total_amount = data.total_amount;
    })
    .then(() => console.log(score))//デバッグ用
    .then(() => {document.getElementById("total_result_score").innerHTML = `正解：${score}問/${total_amount}問`})
    .then(() => {
      if (total_amount == num) {
        console.log("完答しました。");
      }
    })
    .catch(error => console.error("エラー:", error));
  })
})