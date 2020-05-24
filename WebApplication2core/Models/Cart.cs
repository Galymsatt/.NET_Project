using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2core.Models
{
    public class Cart
    {
       

        [Key]
        public long id { get; set; }
        [Required]
        public long user_id { get; set; }
        public User user { get; set; }
        //public Customer customer { get; set; }
        public List<CartProduct> cartProducts { get; set; }
        //public List<Product> products { get; set; }
        public double grandTotal { get; set; }

        public Cart()
        {
        }

        //public Cart(long id, long user_id, User user, List<CartProduct> cartProducts, double grandTotal)
        //{
        //    this.id = id;
        //    this.user_id = user_id;
        //    this.user = user;
        //    this.cartProducts = cartProducts;
        //    this.grandTotal = grandTotal;
        //}


    }
}
