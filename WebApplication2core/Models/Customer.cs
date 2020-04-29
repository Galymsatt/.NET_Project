using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2core.Models
{
    public class Customer
    {

        [Key]
        public long id { get; set; }
        public string name { get; set; }

    }
}
