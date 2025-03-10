package com.icbt.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import com.icbt.model.Bill;
import com.icbt.service.BillService;
import java.io.*;
import java.util.*;

public class BillController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BillService billService;

    // Initialize BillService
    public void init() {
        billService = new BillService();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 String action = request.getParameter("action");

         try {
             if (action == null) {
                 listBills(request, response);
             } else {
                 switch (action) {
                     case "add":
                    	 showAddBillForm(request, response);
                         break;
                     case "edit":
                    	 showEditBillForm(request, response);
                         break;
                     case "delete":
                    	 deleteBill(request, response);
                         break;
                     case "view":
                    	 viewBill(request, response);
                         break;
                     default:
                    	 listBills(request, response);
                         break;
                 }
             }
         } catch (Exception e) {
             request.setAttribute("errorMessage", "Error: " + e.getMessage());
             request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
         }
     
        List<Bill> bills = billService.getAllBills();
        request.setAttribute("bills", bills);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/AdminDashboard/billdetails.jsp");
        dispatcher.forward(request, response);
    }

    // Handle POST request (for adding or updating a bill)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("billId"));
        int bookingNumber = Integer.parseInt(request.getParameter("bookingNumber"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        double totalFare = Double.parseDouble(request.getParameter("totalFare"));
        double taxAmount = Double.parseDouble(request.getParameter("taxAmount"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String paymentStatus = request.getParameter("paymentStatus");
        String paymentMethod = request.getParameter("paymentMethod");
        Date billingDate = new Date(request.getParameter("billingDate"));
        boolean isDriverAssigned = Boolean.parseBoolean(request.getParameter("isDriverAssigned"));

        Bill bill = new Bill();
        bill.setBillId(billId);
        bill.setBookingNumber(bookingNumber);
        bill.setCustomerId(customerId);
        bill.setTotalFare(totalFare);
        bill.setTaxAmount(taxAmount);
        bill.setDiscount(discount);
        bill.setPaymentStatus(paymentStatus);
        bill.setPaymentMethod(paymentMethod);
        bill.setBillingDate(billingDate);
        bill.setDriverAssigned(isDriverAssigned);

        if (billId == 0) {
            billService.addBill(bill);
        } else {
            billService.updateBill(bill);
        }

        response.sendRedirect("/WEB-INF/view/AdminDashboard/billdetails.jsp");
    }


    // List all bills
    private void listBills(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get list of all bills from the database using BillService
            List<Bill> bills = billService.getAllBills();

            // Set bills attribute for the view page (bill.jsp)
            request.setAttribute("bills", bills);

            // Forward to the bill list page (bill.jsp)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/bill.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error retrieving bills: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

 // Controller method
    private void viewBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get bill ID from request parameter
            int billId = Integer.parseInt(request.getParameter("billId"));

            // Fetch the bill details from the database using BillService
            Bill bill = billService.getBillById(billId);

            // Debugging: Print the bill object to the server logs
            System.out.println("Bill ID: " + bill.getBillId());  // Check if Bill ID is valid

            // Check if the bill exists
            if (bill != null) {
                request.setAttribute("bill", bill);
                request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/billdetails.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Bill not found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


    // Show the form to add a new bill
    private void showAddBillForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/billdetails.jsp").forward(request, response);
    }

    // Show the form to edit an existing bill
    private void showEditBillForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int billId = Integer.parseInt(request.getParameter("billId"));

            // Fetch the bill details using the bill service
            Bill bill = billService.getBillByBillId(billId);


            if (bill != null) {
                request.setAttribute("bill", bill);
                request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/billdetails.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Bill not found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // Delete a bill
    private void deleteBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int billId = Integer.parseInt(request.getParameter("billId"));
            billService.deleteBill(billId);

            // After deleting, redirect to the list of bills
            response.sendRedirect("bill?action=list");
        } catch (Exception e) {
            request.setAttribute("error", "Error deleting bill: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
