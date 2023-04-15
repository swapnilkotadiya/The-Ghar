using Microsoft.AspNetCore.Mvc;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using The_Ghar.Areas;
using The_Ghar.Areas.User_Login.Models;
using The_Ghar.DAL;

namespace The_Ghar.Areas.User_Login.Controllers
{

    [Area("User_Login")]
    [Route("User_Login/[controller]/[action]")]


    public class User_LoginController : Controller
    {
        USER_DAL dal = new USER_DAL();
        private IConfiguration Configuration;
        public User_LoginController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        [HttpGet]
        public IActionResult Index()
        {
            Dropdown();
            return View("Index");
        }
        [HttpPost]

        #region "Login"
        public IActionResult Login(User_LoginModel modelUser_Login)
        {
            string connstr = Configuration.GetConnectionString("myConnectionString");
            string error = null;
            if (modelUser_Login.Email == null)
            {
                error += "Email is required";
            }
            if (modelUser_Login.Password == null)
            {
                error += "<br/>Password is required";
            }

            if (error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("Index");
            }
            else
            {
                USER_DAL dal = new USER_DAL();
                DataTable dt = dal.dbo_PR_UserLogin_SelectByEmailPassword(connstr, modelUser_Login.Email, modelUser_Login.Password);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {

                        HttpContext.Session.SetString("UserID", dr["UserID"].ToString());
                        HttpContext.Session.SetString("Name", dr["Name"].ToString());
                        HttpContext.Session.SetString("Email", dr["Email"].ToString());
                        HttpContext.Session.SetString("Password", dr["Password"].ToString());
                        HttpContext.Session.SetString("Address", dr["Address"].ToString());
                        HttpContext.Session.SetString("Mobile", dr["Mobile"].ToString());
                        HttpContext.Session.SetString("RegistrationDate", dr["RegistrationDate"].ToString());
                        HttpContext.Session.SetString("LastLoginDate", dr["LastLoginDate"].ToString());



                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "Email or Password is invalid!";
                    return RedirectToAction("Index");
                }
                if (HttpContext.Session.GetString("Email") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("HomeList", "HomePage", new { area = "HomePage" });
                }
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region "Logout"
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }

        #endregion

        #region "Dropdown"


        public IActionResult Dropdown()
        {

            USER_DAL dal = new USER_DAL();
            DataTable statelist = dal.dbo_PR_State_Dropdown();

            List<State_DropDownModel> list = new List<State_DropDownModel>();
            foreach (DataRow dr in statelist.Rows)
            {
                State_DropDownModel vlst = new State_DropDownModel();
                vlst.StateID = Convert.ToInt32(dr["StateID"]);
                vlst.StateName = dr["StateName"].ToString();
                list.Add(vlst);
            }

            ViewBag.StateList = list;



            List<City_DropDownModel> list2 = new List<City_DropDownModel>();
            ViewBag.CityList = list2;

            return RedirectToAction("Index");
        }


        public IActionResult DropDownByStateForCity(int StateID, List<City_DropDownModel> city_list)
        {

            DataTable citylist = dal.dbo_City_DropdownByStateID(StateID);
            List<City_DropDownModel> list = new List<City_DropDownModel>();
            foreach (DataRow dr in citylist.Rows)
            {
                City_DropDownModel vlst = new City_DropDownModel();
                vlst.CityID = Convert.ToInt32(dr["CityID"]);
                vlst.CityName = (string)dr["CityName"];
                city_list.Add(vlst);
            }
            ViewBag.CityList = city_list;
            var vModel = city_list;
            return Json(vModel);
        }


        #endregion

        #region "UserRegistration"
        public IActionResult UserRegister(User_LoginModel modelUser_Login, int UserID)
        {


            USER_DAL dal = new USER_DAL();

            if (modelUser_Login.UserID == 0)
            {
                DataTable dt = dal.dbo_PR_Users_Insert(modelUser_Login);
            }
            return RedirectToAction("Index");
        }

        #endregion


    }

}











