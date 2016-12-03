<%@include file="/WEB-INF/views/templates/header.jsp" %>


<div class="container">

	<div class="row" style="margin-top: 30px">
		
		<!-- left column -->
		<div class="col-md-5">
			<div class="row">
				<div class="col-md-12">
					<div class="jumbotron i-cus-jumbotron text-center">
						<p class="lead i-color-warn">
							<span class="glyphicon glyphicon-home" style="margin-right: 10px;"></span>
							${customer.customerFirstName}'s home in i-Shop
						</p>
					</div>
				</div>
			</div> <!-- left row 1 -->
			
			<div class="row">
				<div class="col-md-12">
					<div class="panel i-cus-panel i-center-child">
						<div class="panel-heading i-cus-panel-heading">
							<span class="glyphicon glyphicon-user" style="margin-right: 10px;"></span>
							My Profile
							<a href="<c:url value='/customer/profile-form'/>" class="i-cus-panel-link pull-right">
								<span class="glyphicon glyphicon-pencil"></span>
								<span>Edit</span>
							</a>
						</div>
						<div class="panel-body row">
							<div class="col-md-9 col-md-offset-3">
		    					<p>
		    						Name: 
		    						<span class="i-font-bold">${customer.customerFirstName} </span>
		    						<span class="i-font-bold">${customer.customerLastName}</span>
		    					</p>
		    					<p>Username: <span class="i-font-bold">${sessionUsername}</span></p>
		    					<p>E-mail: <span class="i-font-bold">${customer.customerEmail}</span></p>
		    					<p>Phone number: <span class="i-font-bold">${customer.customerPhone}</span></p>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- left row 2 -->
			
			<div class="row">
				<div class="col-md-12">
					<div class="panel i-cus-panel i-center-child">
						<div class="panel-heading i-cus-panel-heading">
							<span class="glyphicon glyphicon-credit-card" style="margin-right: 10px;"></span>
							Billing Address
							<c:choose>
								<c:when test="${not empty customer.billingAddress}">
									<a href="<c:url value='/customer/billing-address-form'/>" class="i-cus-panel-link pull-right">
										<span class="glyphicon glyphicon-pencil"></span>
										<span>Edit</span>
									</a>
								</c:when>
							</c:choose>
						</div>
						<div class="panel-body row">
						
							<c:choose>
								<c:when test="${not empty customer.billingAddress}">
									<div class="col-md-10 col-md-offset-2">
				    					<p>Apt. number: <span class="i-font-bold">${customer.billingAddress.apartmentNumber}</span></p>
				    					<p>Street Name: <span class="i-font-bold">${customer.billingAddress.streetName}</span></p>
				    					<p>City: <span class="i-font-bold">${customer.billingAddress.city}</span></p>
				    					<p>Province / State: <span class="i-font-bold">${customer.billingAddress.state}</span></p>
				    					<p>Country: <span class="i-font-bold">${customer.billingAddress.country}</span></p>
				    					<p>ZIP Code: <span class="i-font-bold">${customer.billingAddress.zipCode}</span></p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="text-center">
										<a href="<c:url value='/customer/billing-address-form'/>" class="btn btn-default i-btn-md">
											Add
										</a>
									</div>
								</c:otherwise>
							</c:choose>
						
						</div>
					</div>
				</div>
			</div> <!-- left row 3 -->
			
			<div class="row">
				<div class="col-md-12">
					<div class="panel i-cus-panel i-center-child">
						<div class="panel-heading i-cus-panel-heading">
							<span class="glyphicon glyphicon-plane" style="margin-right: 10px;"></span>
							Shipping Address
							<c:choose>
								<c:when test="${not empty customer.shippingAddress}">
									<a href="<c:url value='/customer/shipping-address-form'/>" class="i-cus-panel-link pull-right">
										<span class="glyphicon glyphicon-pencil"></span>
										<span>Edit</span>
									</a>
								</c:when>
							</c:choose>
						</div>
						<div class="panel-body row">
							<c:choose>
								<c:when test="${not empty customer.shippingAddress}">
									<div class="col-md-10 col-md-offset-2">
				    					<p>Apt. number: <span class="i-font-bold">${customer.shippingAddress.apartmentNumber}</span></p>
				    					<p>Street Name: <span class="i-font-bold">${customer.shippingAddress.streetName}</span></p>
				    					<p>City: <span class="i-font-bold">${customer.shippingAddress.city}</span></p>
				    					<p>Province / State: <span class="i-font-bold">${customer.shippingAddress.state}</span></p>
				    					<p>Country: <span class="i-font-bold">${customer.shippingAddress.country}</span></p>
				    					<p>ZIP Code: <span class="i-font-bold">${customer.shippingAddress.zipCode}</span></p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="text-center">
										<a href="<c:url value='/customer/shipping-address-form'/>" class="btn btn-default i-btn-md">
											Add
										</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div> <!-- left row 4 -->
			
		</div> <!-- left column -->
		
		
		<!-- right column -->
		<div class="col-md-7">
			<div class="row">
				<div class="col-md-12">
					<div class="jumbotron i-cus-jumbotron text-center">
						<p class="lead">
							Want to revisit your profile? Click on 
						</p>
						<a href="${flowExecutionUrl}&_eventId=goCustomerHome" class="btn btn-warning i-btn-md">
							View My Profile
						</a>
					</div>
				</div>
			</div> <!-- right row 1 -->
		</div> <!-- right column -->
		
	</div> <!-- outer row -->

</div> <!-- container -->

    		
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
