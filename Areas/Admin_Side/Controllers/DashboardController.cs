using Microsoft.AspNetCore.Mvc;
using The_Ghar.BALAdmin;

namespace The_Ghar.Areas.Admin_Side.Controllers
{
    [CheckAccess]
    [Area("Admin_Side")]
    [Route("Admin_Side/[controller]/[action]")]
    public class DashboardController : Controller
    {
        public IActionResult Dashboard()
        {
            return View();
        }
    }
}
