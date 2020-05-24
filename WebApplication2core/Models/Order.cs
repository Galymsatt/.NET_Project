using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2core.Models
{
    public class Order
    {

        [Key]
        public long id { get; set; }
        [Required]
        public long user_id { get; set; }
        public User user { get; set; }
        [Required]
        public long cart_id { get; set; }
        public Cart cart { get; set; }
        public bool completed { get; set; }


    }
}
