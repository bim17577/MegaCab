package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.model.Bill;
import java.util.List;

public class BillService {
    private BillDAO billDAO;

    public BillService() {
        billDAO = new BillDAO();
    }

    // Get all bills
    public List<Bill> getAllBills() {
        return billDAO.getAllBills();
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        return billDAO.addBill(bill);
    }

    // Update an existing bill
    public boolean updateBill(Bill bill) {
        return billDAO.updateBill(bill);
    }

    // Delete a bill
    public boolean deleteBill(int billId) {
        return billDAO.deleteBill(billId);
    }

    // Get a bill by ID
    public Bill getBillById(int billId) {
        return billDAO.getBillById(billId);
    }
    
    // Add the missing method here to resolve the error
    public Bill getBillByBillId(int billId) {
        return billDAO.getBillById(billId);
    }
}
