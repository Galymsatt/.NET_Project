using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2core.Models
{
    public class Product
    {

        [Key]
        public long id { get; set; }
        public string name { get; set; }
        public string content { get; set; }
        public Double price { get; set; }
        
        public long category_id { get; set; }
        

    }
}
