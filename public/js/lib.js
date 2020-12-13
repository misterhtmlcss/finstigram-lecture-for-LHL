console.log('connected.....')


// Finds all the a tags inside the login-info class
let loginText = document.querySelectorAll('.login-info a')

if(loginText.length === 1) {

  loginText = loginText[0]
  
  // 'J' instead 'j'
  const firstLetter = loginText.textContent.split('')[0].toUpperCase()
  // Original username that is now an array ['j', 'a', 'h'....]
  let prevText = loginText.textContent.split('')

  // ['J', 'a', 'h'....]
  prevText.splice(0,1, firstLetter)

  // 'Jah'
  loginText.textContent = prevText.join('')
  
  
  loginText.addEventListener('mouseenter', () => {
    prevText = loginText.textContent
    loginText.textContent = "Logout"
  })
  
  loginText.addEventListener('mouseleave', () => {
    loginText.textContent = prevText
  })
}
