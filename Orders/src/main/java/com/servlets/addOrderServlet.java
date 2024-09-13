package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entities.Order;
import com.entities.OrderItem;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet("/addOrderServlet")
public class addOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        int price = Integer.parseInt(request.getParameter("price"));

        // Open a Hibernate session
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        // Check if the order already exists
        Order order = (Order) session.createQuery("FROM Order O WHERE O.orderId = :orderId")
                .setParameter("orderId", orderId)
                .uniqueResult();

        if (order == null) {
            order = new Order();
            order.setOrderId(orderId);
            session.save(order);
        }

        // Create and add the order item
        OrderItem orderItem = new OrderItem();
        orderItem.setPrice(price);
        orderItem.setOrder(order);

        // Save the order item
        session.save(orderItem);

        tx.commit();
        session.close();

        response.sendRedirect("displayOrder.jsp");
    }
}
