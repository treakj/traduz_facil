
const clientAccept = () => {

  const clientModal = document.querySelector(".modal");

  if((clientModal.classList.contains("accepted")) && (document.referrer.toString().includes("edit"))){
    $('#completedModal').modal("show")
  }

}

export { clientAccept  } ;
