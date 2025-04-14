<html>
' Get all the parameters passed to the script
sAction = CStr(Request.QueryString("action"))
iItemID = CInt(Request.QueryString("item"))
iItemCount = CInt(Request.QueryString("count"))
%>
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>
<%
' Select action based on user input
Select Case sAction
	Case "add"
		AddItemToCart iItemID, iItemCount
		ShowItemsInCart
		%>
		</td></tr>
		<tr><td align="right">
		<a href="shopping.asp?action="><img src="images/shop_look.gif" border="0" width="46" height="46" alt="Continue Looking" /></a>
		<a href="shopping.asp?action=checkout"><img src="images/shop_checkout.gif" border="0" width="46" height="46" alt="Checkout" /></a>
		<%
	Case "del"
		RemoveItemFromCart iItemID, iItemCount
		ShowItemsInCart
		%>
		</td></tr>
		<tr><td align="right">
		<a href="shopping.asp?action="><img src="images/shop_look.gif" border="0" width="46" height="46" alt="Continue Looking" /></a>
		<a href="shopping.asp?action=checkout"><img src="images/shop_checkout.gif" border="0" width="46" height="46" alt="Checkout" /></a>
		<%
	Case "viewcart"
		ShowItemsInCart
		%>
		</td></tr>
		<tr><td align="right">
		<a href="shopping.asp?action="><img src="images/shop_look.gif" border="0" width="46" height="46" alt="Continue Looking" /></a>
		<a href="shopping.asp?action=checkout"><img src="images/shop_checkout.gif" border="0" width="46" height="46" alt="Checkout" /></a>
		<%
	Case "checkout"
		PlaceOrder
		%>
		</td></tr>
		<tr><td align="left">
		<br /><br />
		<h3>Thank you for your order!</h3>
		<p>
		If this had been an actual shopping cart, this is where you would have had them enter
		their personal information and payment method and then taken care of any backend
		processing before finalizing their order.  However as this is a shopping cart sample
		and this is where security becomes a problem, we'll leave it for a future sample.
		</p>
		<%
	Case Else ' Shop
		ShowFullCatalog
		%>
		</td></tr>
		<tr><td align="right">
		<a href="shopping.asp?action=viewcart"><img src="images/shop_cart.gif" border="0" width="46" height="46" alt="View Cart Contents" /></a>
		<%
End Select

' Return cart to Session for storage
Set Session("cart") = dictCart
%>
<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>

</td></tr>
</table>

</body>

</html>