function openQRCamera(node) {
  var reader = new FileReader();
  reader.onload = function() {
    node.value = "";
    qrcode.callback = function(res) {
      if(res instanceof Error) {
        alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
      } else {
        $.post("../clock_ins" , {user_id: res });
        return $.notify({
                // options
                message: 'Successfully clocked in staff , you can clock in another one' 
              },{
                // settings
                type: 'info'
              });
        // node.parentNode.previousElementSibling.value = res;
      }
    };
    qrcode.decode(reader.result);
  };
  reader.readAsDataURL(node.files[0]);
}


function showQRIntro() {
  return confirm("Use your camera to take a picture of a QR code.");
}