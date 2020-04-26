using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2core.Models
{
    public class ApplicationContext : DbContext
    {

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }

        public DbSet<User> Users { get; set; }


        public ApplicationContext()
        {
            Database.EnsureCreated();
        }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsbuilder)
        //{
        //    optionsbuilder.UseMySql("server=localhost;port=3307;userid=root;password=;database=.NET_PROJECT;");

        //}

        protected override void OnConfiguring(DbContextOptionsBuilder optionsbuilder)
        
            => optionsbuilder.UseMySql("server=localhost;port=3307;userid=root;password=;database=.NET_PROJECT;");

        

    }
}
