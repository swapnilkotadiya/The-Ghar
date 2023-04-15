using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using The_Ghar.Models;
using The_Ghar.BAL;

namespace The_Ghar.Controllers
{
    [CheckAccess]
    public class HomeController : Controller
    {
        

        public HomeController()
        {
            
        }

        [CheckAccess]
        public IActionResult Index()
        {
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