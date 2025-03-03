package com.icbt.service;

import com.icbt.dao.CarDAO;
import com.icbt.model.Car;
import java.sql.SQLException;
import java.util.List;

public class CarService {

    private static CarService instance;
    private CarDAO carDAO;

    private CarService() { // Private constructor to prevent direct instantiation
        this.carDAO = new CarDAO();
    }

    // Singleton instance method
    public static CarService getInstance() {
        if (instance == null) {
            synchronized (CarService.class) {
                if (instance == null) {
                    instance = new CarService();
                }
            }
        }
        return instance;
    }

    public void addCar(Car car) throws SQLException {
        carDAO.addCar(car);
    }

    public List<Car> getAllCars() throws SQLException {
        return carDAO.getAllCars();
    }

    public Car getCarById(int carId) throws SQLException {
        return carDAO.getCarById(carId);
    }

    public void updateCar(Car car) throws SQLException {
        carDAO.updateCar(car);
    }

    public void deleteCar(int carId) throws SQLException {
        carDAO.deleteCar(carId);
    }
}
