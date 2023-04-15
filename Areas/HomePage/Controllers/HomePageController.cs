using Microsoft.AspNetCore.Mvc;
using System.Data;
using The_Ghar.Areas.HomePage.Models;
using The_Ghar.BAL;
using The_Ghar.DAL;

namespace The_Ghar.Areas.HomePage.Controllers
{
    [CheckAccess]
    [Area("HomePage")]
    [Route("HomePage/[controller]/[action]")]
    public class HomePageController : Controller
    {
        HomePage_DAL dal = new HomePage_DAL();
        private IConfiguration Configuration;
        public HomePageController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region Home List By User's City
        public IActionResult HomeList(int UserID)
        {

            DataTable dt = dal.dbo_PR_HomePage_HomeList_SelectAll(UserID);
            return View("HomePage", dt);

        }
        #endregion

        public IActionResult Page() 
        {
            return View();
        }
    }
}
