<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->



  

<style>
 html {
  position: relative;
  min-height: 100%;
  padding-bottom:90px;
}
body {
  margin-bottom: 90px;
}
footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 180px;
}
.paypalBox{
width: 100px;
}
    </style>
<meta charset="UTF-8">
</head>
<body>

<script
    src="https://www.paypal.com/sdk/js?client-id=AdMa8na1PhoSuxI_9HH9oSzk4To_oDmsNBnm5Iw1ayPLRkQZr7KMyPbhkBkBVAt-oUFdrCr3OKEQdy4-"> // Required. Replace YOUR_CLIENT_ID with your sandbox client ID.
  </script>
</body>
	<footer class="footer mt-auto py-3 bg-light  bg-light">
		<div class="container  bg-light">

			<div class="row align-items-center bg-light">

				<div class="col bg-light" >
					
					<h4>Faites nous un don !</h4>
					Nous ne prenons aucune commission sur les trocs de nos utilisateurs. C'est pourquoi, si vous voulez nous soutenir, vous pouvez nous faire un don ci-dessous !
					<br>
					
					<form action="https://www.paypal.com/donate" method="post"
					target="_top">
					<input type="hidden" name="hosted_button_id" value="KDR34YY46WW4J" />
					<input type="image"
						src="https://www.paypalobjects.com/fr_FR/FR/i/btn/btn_donateCC_LG.gif"
						border="0" name="submit"
						title="PayPal - The safer, easier way to pay online!"
						alt="Donate with PayPal button" /> <img alt="" border="0"
						src="https://www.paypal.com/fr_FR/i/scr/pixel.gif" width="1"
						height="1" />
				</form>
			
				</div>
				<div class="col">
					<h4>A propos de nous</h4>
					Nous sommes deux étudiantes qui avons à coeur de limiter la
					surconsommation. C'est comme ça qu'est né Swap, une plateforme de
					troc totalement gratuite ! Merci de nous suivre dans cette aventure.
				</div>
				
			</div>
			<hr>
			<p>Clémence Cousin & Estelle Hu © 2021</p>
		</div>

				


	</footer>
	<script>
  paypal.Buttons({
    createOrder: function(data, actions) {
      // This function sets up the details of the transaction, including the amount and line item details.
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: '5'
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      // This function captures the funds from the transaction.
      return actions.order.capture().then(function(details) {
        // This function shows a transaction success message to your buyer.
        alert('Transaction completed by ' + details.payer.name.given_name);
      });
    }
  }).render('#paypal-button-container');
  //This function displays Smart Payment Buttons on your web page.
</script>
</html>