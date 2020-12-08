
const acionaModal = () => {
  const modal = document.querySelector("#exampleModal")
  const aba =  document.querySelector("#proposals")

  aba.addEventListener('click', acionaModal)
  
}


export {  acionaModal };