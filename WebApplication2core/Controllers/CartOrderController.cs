using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication2core.Models;

namespace WebApplication2core.Controllers
{
    public class CartOrderController : Controller
    {
        private readonly ApplicationContext _context;

        public CartOrderController(ApplicationContext context)
        {
            _context = context;
        }

        [Authorize(Roles = "user")]
        public IActionResult AddProductToCart(long? product_id)
        {
            var varUser = _context.Users.Where(u=>u.Email.Equals(User.Identity.Name));
            User user = (User)varUser.FirstOrDefault();

            if (user != null)
            {

            }

            Cart cart = _context.Carts.FirstOrDefault(c => c.user_id == user.Id);

            if (cart != null)
            {
                var varCartProducts = _context.CartProducts.Where(c => c.cart_id == cart.id);
                List<CartProduct> cartProducts = new List<CartProduct>();
                foreach (CartProduct c in varCartProducts)
                {
                    cartProducts.Add(c);
                }
                cart.cartProducts = cartProducts;
            }
            else
            {
                //cart = new Cart(1, user.Id, user, new List<CartProduct>(), 0);
                cart = new Cart();
                cart.user = user;
                cart.user_id = user.Id;
                cart.cartProducts = new List<CartProduct>();
                _context.Add(cart);
                _context.SaveChanges();
                cart = _context.Carts.FirstOrDefault(c => c.user_id == user.Id);//check it
                
                Console.WriteLine();

            }

            Product product = _context.Products.FirstOrDefault(p => p.id == product_id);

            Boolean productExistsInCart = false;
            foreach (CartProduct c in cart.cartProducts)
            {
                if (c.product_id==product_id)
                {
                    productExistsInCart = true;
                    break;
                }
            }

            if (!productExistsInCart)
            {
                //CartProduct cartProduct = new CartProduct(1, cart.id, cart, (long)product_id, product);
                CartProduct cartProduct = new CartProduct();
                cartProduct.cart_id = cart.id;
                cartProduct.cart = cart;
                cartProduct.product_id = (long)product_id;
                cartProduct.product = product;
                _context.Add(cartProduct);
                cart.cartProducts.Add(cartProduct);
                //_context.SaveChanges();
            }

            cart.grandTotal = calculateTotalPrice(cart.id);

            //_context.Add(cart);
            _context.SaveChanges();

            return RedirectToAction("Index", cart);
        }

        public double calculateTotalPrice(long? cartId)
        {
            double totalPrice = 0;
            Product product;
            var varCartProducts = _context.CartProducts.Where(c => c.cart_id == cartId);
            foreach (CartProduct c in varCartProducts)
            {
                product = _context.Products.FirstOrDefault(p => p.id == c.product_id);
                totalPrice += product.price;
            }

            return totalPrice;
        }

        public IActionResult DeleteCartProduct(long? cartProductId)
        {
            var cartProduct = _context.CartProducts.Find(cartProductId);
            _context.CartProducts.Remove(cartProduct);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult MakeOrder()
        {

            User user = _context.Users.FirstOrDefault(u => u.Email.Equals(User.Identity.Name));
            long? id = user.Id;
            Cart cart = _context.Carts.FirstOrDefault(c => c.user_id == id);

            Order order = new Order();
            order.user = user;
            order.user_id = user.Id;
            order.cart = cart;
            order.cart_id = cart.id;

            cart.user_id = -1;
            _context.Update(cart);

            _context.Add(order);
            _context.SaveChanges();
            order = _context.Orders.FirstOrDefault(o => o.user_id==user.Id && o.cart_id==cart.id);

            return View("OrderSuccess", order);
        }

    
        // GET: CartOrder
        [Authorize(Roles = "user")]
        public IActionResult Index(long? id)
        {

            //if (id == null)
            //{
            //    User user = _context.Users.FirstOrDefault(u => u.Email.Equals(User.Identity.Name));
            //    id = user.Id;
            //}

            User user = _context.Users.FirstOrDefault(u => u.Email.Equals(User.Identity.Name));
            id = user.Id;

            Cart cart = _context.Carts.FirstOrDefault(c => c.user_id == id);
            if (cart != null)
            {
                cart.grandTotal = calculateTotalPrice(cart.id);


                var varCartProduct = _context.CartProducts.Where(c => c.cart_id == cart.id);
                List<CartProduct> cartProducts = new List<CartProduct>();

                Product product;
                foreach (CartProduct c in varCartProduct)
                {
                    product = _context.Products.FirstOrDefault(p => p.id == c.product_id);
                    c.product = product;

                    cartProducts.Add(c);
                }

                cart.cartProducts = cartProducts;

                _context.Update(cart);
                _context.SaveChanges();

                return View("Cart", cart);
            }

            return View("Cart");
        }

    }
}
