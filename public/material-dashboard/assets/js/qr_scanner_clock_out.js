function openQRCameraClockOut(node) {
  var reader = new FileReader();
  reader.onload = function() {
    node.value = "";
    qrcode.callback = function(res) {
      if(res instanceof Error) {
        alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
      } else {
        $.post("../clock_outs" , {user_id: res });
        // node.parentNode.previousElementSibling.value = res;
        return $.notify({
                // options
                message: 'Successfully clocked out staff , you can clock out another one' 
              },{
                // settings
                type: 'info'
              });
      }
    };
    qrcode.decode(reader.result);
  };
  reader.readAsDataURL(node.files[0]);
}


function showQRIntro() {
  return confirm("Use your camera to take a picture of a QR code.");
}