<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">

	<div class="page-header">
		<h2 class="header-msg-default">
			My Orders
		</h2>
	</div>
	
	<div>
	<c:forEach var="order" items="${orderList}">
		<div class="panel i-order-panel i-center-child">
		
			<div class="panel-heading i-order-panel-heading">
				<div class="row">
					<div class="col-md-3">
						<span class="i-font-bold">Ordered on: </span>${order.creationTime}
					</div>
					<div class="col-md-3">
						<span class="i-font-bold">Ordered ID: </span>${order.orderId}
					</div>
				</div>
			</div>
			
			<div class="panel-body text-center">
				<div class="row">
				
					<div class="col-md-6">
						<div class="panel panel-default">
    						<table class="table table-condensed">
    							<c:forEach var="item" items="${order.orderItems}">
    								<tr>
    									<td class="i-wd-10">
    										<img src="${imagePath}/product-images/product_${item.itemProductId}.png" alt="image" 
													class="img-responsive img-thumbnail">
    									</td>
    									<td class="i-wd-50">${item.itemProductName}</td>
    									<td class="i-wd-30">x ${item.itemProductQuantity}</td>
    								</tr>
    							</c:forEach>
    						</table>
    					</div>
					</div> <!-- left col -->
					
					<div class="col-md-6">
						<div class="panel panel-default">
							<table class="table table-condensed table-bordered">
								<tr>
									<th class="i-wd-30 text-center">Total paid</th>
									<th class="i-wd-40 text-center">Shipped to</th>
									<th class="i-wd-30 text-center">Order status</th>
								</tr>
								<tr>
									<td>${moneySign} ${order.grandTotal}</td>
									<td>${order.recipientFirstName} ${order.recipientLastName}</td>
									<td>${order.orderStatus}</td>
								</tr>
							</table>
						</div>
					
						<a href="<c:url value='/customer/order/${order.orderId}'/>" class="-btn -btn-link -i-btn-md i-font-16">
							<span class="glyphicon glyphicon-th-list"></span>
							View Order Detail
						</a>
					</div> <!-- right col -->
				</div> <!-- row -->
			</div> <!-- order panel body -->
			
		</div> <!-- order panel -->
	</c:forEach>
	</div>
	
	    	
	<div class="row i-button-row">
		<div class="col-md-6 text-left">
		</div>
		<div class="col-md-3 text-right">
			<a href="<c:url value='/customer/home'/>" class="btn btn-warning i-btn-lg text-center">
				Back to Customer Home
			</a>
		</div>
		<div class="col-md-3 text-right">
			<a href="<c:url value='/product/list'/>" class="btn btn-warning i-btn-lg">
				Keep Shopping
			</a>
		</div>
	</div>	<!-- button row -->
	
</div> <!-- container -->
    		

<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
    		