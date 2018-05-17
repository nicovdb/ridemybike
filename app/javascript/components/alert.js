import swal from 'sweetalert';


function bindSweetAlertButtonDemo() {
  document.getElementById('alert').addEventListener('click', () => {
    swal({
      title: "Reservation!",
      text: "Ride my bike!",
      icon: "success",
    })
  });
}

export { bindSweetAlertButtonDemo };
