using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication2core.Models;

namespace WebApplication2core.Controllers
{
    public class HomeController : Controller
    {

        private readonly ApplicationContext _context;

        public HomeController(ApplicationContext context)
        {
            _context = context;
        }

        //[HttpGet("categoryProducts/{categoryName}")]
        public IActionResult Index(String categoryName)
        {

            List<Product> products = _context.Products.ToList();
            foreach(Product p in products){
                p.category = _context.Categories.Find(p.category_id);
            }

            ViewBag.Products = products;

            var categories = _context.Categories.ToList();
            ViewBag.Categories = categories;


            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
