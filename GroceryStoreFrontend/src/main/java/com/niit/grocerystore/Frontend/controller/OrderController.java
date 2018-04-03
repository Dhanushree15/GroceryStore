package com.niit.grocerystore.Frontend.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.grocerystore.Dao.BillingDao;
import com.niit.grocerystore.Dao.CartDao;
import com.niit.grocerystore.Dao.CartItemsDao;
import com.niit.grocerystore.Dao.OrderDao;
import com.niit.grocerystore.Dao.OrderItemsDao;
import com.niit.grocerystore.Dao.PayDao;
import com.niit.grocerystore.Dao.ProductDao;
import com.niit.grocerystore.Dao.ShippingDao;
import com.niit.grocerystore.Dao.UserDao;
import com.niit.grocerystore.model.Billing;
import com.niit.grocerystore.model.Cart;
import com.niit.grocerystore.model.CartItems;
import com.niit.grocerystore.model.Order;
import com.niit.grocerystore.model.OrderItems;
import com.niit.grocerystore.model.Pay;
import com.niit.grocerystore.model.Product;
import com.niit.grocerystore.model.Shipping;
import com.niit.grocerystore.model.User;

@Controller

public class OrderController {

	@Autowired
	Cart cart;
	@Autowired 
	CartDao cartDao;
	@Autowired 
	CartItems cartItems;
	@Autowired 
	CartItemsDao cartItemsDao;
//	@Autowired 
//	Card card;
//	@Autowired 
//	CardDao cardDao;
	@Autowired 
	Billing billing;
	@Autowired 
	BillingDao billingDao;
	@Autowired 
	Shipping shipping;
	@Autowired 
	ShippingDao shippingDao;
	@Autowired 
	Pay pay;
	@Autowired 
	PayDao payDao;
	@Autowired 
	Order order;
	@Autowired 
	OrderDao orderDao;
	@Autowired 
	OrderItems orderItems;
	@Autowired 
	OrderItemsDao orderItemsDao;
	@Autowired 
	Product product;
	@Autowired 
	ProductDao productDao;
	@Autowired 
	User user;
	@Autowired 
	UserDao userDao;
	@Autowired 
	List<CartItems> cartItem;
	
//	@Autowired
//	private JavaMailSender mailSender;
	
	String o;
	
	@RequestMapping("/Buyall")
	public String orderall(Model model,HttpSession session) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		if(!(authentication instanceof AnonymousAuthenticationToken)) {
			String currusername=authentication.getName();
			user=userDao.getUser(currusername);
			cart=user.getCart();
			product=null;
			cartItem=cartItemsDao.getlist(cart.getCtId());
			if((cartItem==null)||cartItem.isEmpty())
			{
				return "redirect:/viewcart";
			}
			else
			{
				billing=billingDao.getBilling(user.getUserId());
			List<Shipping> shipping=shippingDao.getaddbyuser(user.getUserId());
				model.addAttribute("billing", billing);
				model.addAttribute("user", user);
				model.addAttribute("shipping", shipping);
			    session.setAttribute("p",product);	
				
			}
			return "addressorder";		
		}else {
			return "redirect:/";
		}	
	}
	
	@RequestMapping("/Buy/{p_id}/{ci_id}")
	public String order(@PathVariable("p_id") String id,Model model,HttpSession session){
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		if(!(authentication instanceof AnonymousAuthenticationToken)) {
			String currusername=authentication.getName();
			user=userDao.getUser(currusername);
			cart=user.getCart();
			cartItems=null;
			product=productDao.getProduct(id);
			billing=billingDao.getBilling(user.getUserId());
			List<Shipping> shipping=shippingDao.getaddbyuser(user.getUserId());
			model.addAttribute("billing", billing);
			model.addAttribute("user", user);
			model.addAttribute("shipping", shipping);
			model.addAttribute("shipping", new Shipping());
			session.setAttribute("p", product);
			return "addressorder";
		}
		else {
			return "redirect:/";
		}
	}
	   
	@RequestMapping("/orderConfirm")
	public String payment(@ModelAttribute("shipping") Shipping sh,Model model) {
		if(cartItems==null)
		{
			System.out.println("sorry");
		}
		sh.setUser(user);
		shipping=sh;
		model.addAttribute("billing", billing);
		model.addAttribute("shipping", shipping);
		model.addAttribute("prot", product);
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("cart", cart);
		return "orderconfirm";
	}
	
	@RequestMapping("/previous")
	public String previous (Model model) {
	   List<Shipping> shippingAddresses=shippingDao.getaddbyuser(user.getUserId());
	   model.addAttribute("shipping", shipping);
	   model.addAttribute("billing", billing);
	   model.addAttribute("shipping", shipping);
	   model.addAttribute("product", product);
	   
	   return "addressorder";
    }
	
//	@RequestMapping("/pay")
//	public String pay(Model model) {
//		List<Card> cards=cardDao.getcardbyuser(user.getUserId());
//		model.addAttribute("cards", cards);
//		model.addAttribute("card", new Card());
//		return "Payment";
//	}
	
//	@RequestMapping("/payment")
	//public String payment(@RequestParam("payb") String str,@RequestParam("otp")String otp, Model model){
		
		//System.out.println(1324);
	//	int a;
	//	System.out.println(str);
		
	//	if(str.equalsIgnoreCase("Start Subscription")) {
	//		a=2;
	//	}else {
	//		a=Integer.parseInt(str);
	//	}
	//	System.out.println(a);
		
	//	switch(a) {
	//	case 1:
	//		if(otp.equals(o))
	//		{
	//			pay.setPaymentMethod("COD");
	//			pay.setPayStatus("no");
	//		}
	//		else
	//		{
	//			return "redirect:/pay";
	//		}
	//		break;
			
	//	case 2:
	//		pay.setPaymentMethod("card");
	//		pay.setPayStatus("yes");
	//		payDao.saveorupdate(pay);
//			cardDao.saveorupdate(c);
			
	//		break;
			
	//	case 3:
//		pay.setPaymentMethod("Internet Banking");
	//		pay.setPayStatus("yes");
	//	}
	//	return "redirect:/orderconfirmation";
//	}
	
	
	@RequestMapping("/orderconfirmation")
	public String orderconfirmation(HttpSession session) {
		System.out.println(32);
		order.setBilling(billing);
		order.setShipping(shipping);
		order.setPay(pay);
		order.setUser(user);
		System.out.println(524);
		if((cartItem==null)||cartItem.isEmpty())
		{
			order.setOrdGrandtotal(product.getProductPrice());
			orderDao.saveorupdate(order);
			orderItems.setOrder(order);
			orderItems.setOrditemsproductId(product.getProductId());
			orderItemsDao.saveorupdate(orderItems);
			cart.setCtGrandtotal(cart.getCtGrandtotal() - cartItems.getCtItemsPrice());
			cart.setCtTotalitem(cart.getCtTotalitem() - 1);
			session.setAttribute("items",cart.getCtTotalitem());
			cartDao.saveorupdate(cart);
			cartItemsDao.delete(cartItemsDao.getlistall(cart.getCtId(),product.getProductId()).getCtItemsId());
			System.out.println(324);
		}
		else
		{
			System.out.println(656);
			order.setOrdGrandtotal(cart.getCtGrandtotal());
			orderDao.saveorupdate(order);
			for(CartItems c: cartItem)
			{
				System.out.println(3444);
				orderItems.setOrder(order);
				orderItems.setOrditemsproductId(c.getProduct().getProductId());
				System.out.println(3443);
				orderItemsDao.saveorupdate(orderItems);
				cartItemsDao.delete(c.getCtItemsId());
			}
			cart.setCtGrandtotal(0.0);
			cart.setCtTotalitem(0);
			System.out.println(3243);
			session.setAttribute("items", cart.getCtTotalitem());
			cartDao.saveorupdate(cart);
		}
		    cartItems=null;
		    cartItem=null;
			product=null;
			order=new Order();
			orderItems=new OrderItems();
			System.out.println(565);
			return "Thankyou";
		
	}
		
//		@RequestMapping(value="/SendMail")
//		public void SendMail() {
//			System.out.println(21312);
//			Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
//			if(!(authentication instanceof AnonymousAuthenticationToken)) {
//				String currusername=authentication.getName();
//				user=userDao.getUserEmailid(currusername);
//				Otpganarater ot=new Otpganarater();
//			//	String o=ot.Otpga();
//				o=ot.Otpga();
//				String recipientAddress=user.getUserEmailid();
//				String subject="OTP";
//			//  String subject=request.getParameter("subject");
//				String message="your one time password is "+o+" ";
//				
//		   //  prints debug info
//				
//				System.out.println("To:" +recipientAddress);
//				System.out.println("Subject:" +subject);
//				System.out.println("Message:" +message);
//				
//		   // System.out.println("OTP:" +otp);
//		   // creates a simple e-mail object
//				
//		SimpleMailMessage email=new SimpleMailMessage();
//		email.setTo(recipientAddress);
//		email.setSubject(subject);
//		email.setText(message);
//	  //email.setSubject(otp);
//	  //sends the e-mail
//		mailSender.send(email);
//		
//	//forwards to the view named "Result"
//	//return "Result";	
//			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

