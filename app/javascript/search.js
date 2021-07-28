window.addEventListener('load', function(){

  const clickOpenUser = document.getElementById("users")
  const clickDownUsers = document.getElementById("user")
  const clickOpenLife = document.getElementById("lives")
  const clickRightLine = document.getElementById("user-line")
  const clickLeftLine = document.getElementById("lives-line")

  clickOpenUser.addEventListener('click', function(){
    clickDownUsers.setAttribute("style", "display:block;")
    clickRightLine.setAttribute("style", "border-bottom:solid grey 10px;")
    clickLeftLine.setAttribute("style", "border-bottom:none;")
  })

  clickOpenLife.addEventListener('click', function(){
    clickDownUsers.setAttribute("style", "display:none;")
    clickLeftLine.setAttribute("style", "border-bottom:solid grey 10px;")
    clickRightLine.setAttribute("style", "border-bottom:none;")
  })

})