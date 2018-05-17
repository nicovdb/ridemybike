import swal from 'sweetalert';


function bindSweetAlertButtonDemo() {
  document.querySelector('.alert_sweet').addEventListener('click', () => {
    swal({
      title: "Reservation!",
      text: "Ride my bike!",
      icon: "success"
    })
  });
}

export { bindSweetAlertButtonDemo };
