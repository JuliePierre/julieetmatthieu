import swal from 'sweetalert';

function popUp() {
  document.addEventListener("DOMContentLoaded", () => {
    let landingPage = document.getElementById('landing-banner');
    if (landingPage) {
      let notificationContainer = document.getElementById('notification-container');
      if (notificationContainer === null) {
        swal({
          title: "Hello tout le monde",
          text: "Vous avez donc bien reçu le faire-part test, c'est un bon début :) Auriez-vous la gentillesse de jeter un oeil au site et me dire si vous voyez des choses à modifier s'il vous plait ?",
          icon: "info",
          button: {
            text: "Compris",
            className: "btn btn-green",
            closeModal: true,
          }
        });
      }
    }
  });
}

export { popUp };
