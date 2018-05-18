import swal from 'sweetalert';



function bindSweetAlertButtonDemo() {
  document.querySelector('.alert_sweet').addEventListener('click', () => {
    swal({
      title: "Bike created!",
      text: "Ride my bike!",
      icon: "success",
      button: false
    })
  });
}

export { bindSweetAlertButtonDemo };
