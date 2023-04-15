using Microsoft.AspNetCore.Mvc;
using System.Configuration;
using System.Data;
using The_Ghar.Areas.Admin_Login.Models;
using The_Ghar.DAL;

namespace The_Ghar.Areas.Admin_Login.Controllers
{
    [Area("Admin_Login")]
    [Route("Admin_Login/[controller]/[action]")]
    public class AdminController : Controller
    {
        Admin_Login_DAL dal = new Admin_Login_DAL();
        private IConfiguration Configuration;
        public AdminController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        public IActionResult AdminLogin()
        {
            return View("AdminLogin");
        }
        #region "Login"
        public IActionResult Login(Admin_LoginModel modelAdmin_Login)
        {
            string connstr = Configuration.GetConnectionString("myConnectionString");
            string error = null;
            if (modelAdmin_Login.Email == null)
            {
                error += "Email is required";
            }
            if (modelAdmin_Login.Password == null)
            {
                error += "<br/>Password is required";
            }

            if (error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("AdminLogin");
            }
            else
            {
                Admin_Login_DAL dal = new Admin_Login_DAL();
                DataTable dt = dal.dbo_PR_AdminLogin_SelectByEmailPassword(connstr, modelAdmin_Login.Email, modelAdmin_Login.Password);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {

                        HttpContext.Session.SetString("AdminID", dr["AdminID"].ToString());
                        HttpContext.Session.SetString("Name", dr["Name"].ToString());
                        HttpContext.Session.SetString("Email", dr["Email"].ToString());
                        HttpContext.Session.SetString("Password", dr["Password"].ToString());

                        HttpContext.Session.SetString("CreationDate", dr["CreationDate"].ToString());
                        HttpContext.Session.SetString("ModificationDate", dr["ModificationDate"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "Email or Password is invalid!";
                    return RedirectToAction("AdminLogin");
                }
                if (HttpContext.Session.GetString("Email") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("AdminSide", "AdminSide", new { area = "Admin_Side" });
                }
            }
            return RedirectToAction("AdminLogin");
        }
        #endregion

        #region "Logout"
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }

        #endregion

    }
}

