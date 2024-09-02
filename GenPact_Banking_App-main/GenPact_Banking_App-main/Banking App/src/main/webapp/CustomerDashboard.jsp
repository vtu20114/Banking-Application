<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.banking.model.Customer, java.util.*,com.banking.model.Transaction,com.bankingapp.dao.CustomerDAO" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style><%@include file="CSS/style.css"%></style>
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script>
     
     	$(document).ready(function(){
     		fetchBalance();
     	});
     	
     	function fetchBalance(){
     		$.ajax({
     			url:'BalanceServlet',
     			type:'GET',
     			success:function(data){
     				$('#balance').text(data.balance);
     			},
     			error: function(){
     				alert('Failure while fetching balance!');
     			}
     		});
     	}
     </script>
</head>

<body>
<% 
    if (session == null || session.getAttribute("customer") == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

	Customer customer = (Customer) session.getAttribute("customer");
	
	CustomerDAO customerDAO = new CustomerDAO();
	int accountNo = (int) session.getAttribute("accountNo");
	List<Transaction> transactions = customerDAO.getTransactions(accountNo);

%>

    <div class="main container-fluid">

        <div class="child-1 row">
            <div class="welcome col-8">
                <h4>Welcome back,</h4>
                <h1><%= customer.getFullName() %>!</h1>
            </div>
            <div class="balance col-4">
                <p>Total Balance</p>
                <div class="span-view-icon">
                    <div style="min-height: 120px;">
                        <span>Rs. </span>
                        <div class="collapse collapse-horizontal" id="showBalance">
                            <span class="text" id="balance"></span>
                        </div>
                    </div>
                    <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#showBalance"
                        aria-expanded="false" aria-controls="collapseWidthExample">
                        <span class="material-symbols-outlined">
                            visibility
                        </span>
                    </button>
                </div>
            </div>

        </div>

        <div class="child-2 row">
            <div class="options col-8">
                <div class="options1">
                    <div class="options-2">
                        <button class="tablink" onclick="openPage('details',this)" id="defaultOpen">Details</button>
                        <button class="tablink" onclick="openPage('withdraw',this)">Withdraw</button>
                        <button class="tablink" onclick="openPage('deposit',this)">Deposit</button>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <form action="logout">
                    	<button class="logout">Logout</button>
                    </form>
                </div>
                <hr>
                <div class="tabcontent" id="details">
                    <div class="details-1">
                        <p>Customer Details</p>
                        <div class="details-2">
                            <div class="details3">
                                <span class="material-symbols-outlined">
                                    person
                                </span>
                                <%= customer.getFullName() %>	<br>
                                <span class="material-symbols-outlined">
                                    smartphone
                                </span>
                                <%= customer.getMobileNo() %><br>
                                <span class="material-symbols-outlined">
                                    alternate_email
                                </span>
                                <%= customer.getEmailId() %><br>
                                <span class="material-symbols-outlined">
                                    calendar_today
                                </span> <%= customer.getDateOfBirth() %><br>
                                <span class="material-symbols-outlined">
                                    home_pin
                                </span><%= customer.getAddress()  %><br>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="details-1">
                        <p>Account Details</p>
                        <div class="details-2">
                            <div class="details3">
                                <span class="material-symbols-outlined">
                                    account_balance
                                </span>
                                <%= customer.getAccountNo() %><br>
                                <span class="material-symbols-outlined">
                                    savings
                                </span><%= customer.getAccountType()  %>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="withdraw" class="tabcontent">
                    <form action="WithdrawServlet" method="post">
                        <label for="withdraw">Enter Amount</label><br>
                        <input type="number" id="withdraw" name="amount" min="1" placeholder="INR"><br>
                        <button class="btn btn-primary" type="submit" value="Withdraw">Submit</button>
                    </form>
                </div>

                <div id="deposit" class="tabcontent">

                    <div class="deposit-title">
                        <form action="DepositServlet" method="post"	>
                            <label for="deposit">Enter Amount</label><br>
                            <input type="number" id="withdraw" name="amount" min="1" placeholder="INR"><br>
                            <button class="btn btn-primary" type="submit" value = "Deposit">Submit</button>
                        </form>
                    </div>
                </div>

            </div>
            <div class="transactions col-4">
                <div class="title row">
                    <div class="title-text col-10">Transaction History</div>
                    <div class="title-icon-class col-2 ">
                        	<button class="btn" type="submit" data-bs-toggle="collapse" aria-expanded="false"
                            aria-controls="collapseWidthExample" data-bs-target="#showTransactions">
                            <span class="material-symbols-outlined">
                                visibility
                            </span>
                        </button>
                        <form action="downloadPDF" method="get">
                        	<button class="btn" type="submit">
                            <span class="material-symbols-outlined">
                                print
                            </span>
                        </button>
                        </form>
                    </div>
                    
                    <div class="transaction-list" id="showTransactions">
                    	<%
                    		for (Transaction transaction: transactions){
                    			%>
                    			<% if("WITHDRAW".equals(transaction.getTransactionType())) {
                    				%>
                    				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#EA3323"><path d="m216-160-56-56 464-464H360v-80h400v400h-80v-264L216-160Z"/></svg>
									
                    			<%
                    			}
                    			else if("DEPOSIT".equals(transaction.getTransactionType())) {
                    				%>
                    					
                    				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#75FB4C"><path d="M200-200v-400h80v264l464-464 56 56-464 464h264v80H200Z"/></svg>
                    			<%
                    			}
                    			%>
                    			
                    			<p><%= transaction.getTransactionType() %></p>
                    			<p><%= transaction.getAmount() %></p>
                    			<hr>
                    			
                    			<% 
                    		}
                    	%>
                    	
                    </div>

                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script>

        function openPage(pageName, elmnt) {
            var i, tabcontent, tablinks, color;
            color = '#ff7f3e'
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
            }

            document.getElementById(pageName).style.display = "block";

            elmnt.style.backgroundColor = color;
        }
        
        document.getElementById("defaultOpen").click();

    </script>

</body>

</html>