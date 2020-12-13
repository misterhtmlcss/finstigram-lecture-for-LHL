let loginText = document.querySelectorAll('.login-info a')


if(loginText.length === 1) {
  loginText = loginText[0]
  
  const firstLetter = loginText.textContent.split('')[0].toUpperCase()
  let prevText = loginText.textContent.split('')
  prevText.splice(0,1, firstLetter)
  loginText.textContent = prevText.join('')
  
  
  loginText.addEventListener('mouseenter', () => {
    prevText = loginText.textContent
    loginText.textContent = "Logout"
  })
  
  loginText.addEventListener('mouseleave', () => {
    loginText.textContent = prevText
  })
}
