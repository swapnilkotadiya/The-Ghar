using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.Areas.User_Login.Models;
using The_Ghar.BALAdmin;
using The_Ghar.DAL;

namespace The_Ghar.Areas.Admin_Side.Controllers
{
    [CheckAccess]
    [Area("Admin_Side")]
    [Route("Admin_Side/[controller]/[action]")]

    public class HomeController : Controller
    {
        Admin_Side_DAL dalHome = new Admin_Side_DAL();
        private IConfiguration Configuration;
        public HomeController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #region Home Select All
        public IActionResult HomeList()
        {
            DataTable dt = dalHome.dbo_PR_Home_SelectAll();
            return View("HomeList", dt);
        }
        #endregion

        #region Home Delete
        public IActionResult HomeDelete(int HomeID)
        {


            DataTable dt = dalHome.dbo_PR_Home_DeleteByPK(HomeID);

            return RedirectToAction("HomeList");

        }
        #endregion

        #region Home Add
        public IActionResult HomeAdd(int HomeID)
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

            if (HomeID != null)
            {

                DataTable dt = dalHome.dbo_PR_Home_GetValue_For_Edit(HomeID);
                HomeModel modelHome = new HomeModel();
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {

                        modelHome.HomeID = Convert.ToInt32(dr["HomeID"]);
                        modelHome.HomeName = (string)dr["HomeName"];
                        modelHome.Email = (string)dr["Email"];
                        modelHome.AreaLocation = (string)dr["AreaLocation"];
                        modelHome.Mobile = (string)dr["Mobile"];
                        modelHome.Logo = (string)dr["Logo"];
                        modelHome.StateID = Convert.ToInt32(dr["StateID"]);
                        modelHome.CityID = Convert.ToInt32(dr["CityID"]);
                        modelHome.CostPerPerson = (string)dr["CostPerPerson"];
                        modelHome.Categories = (string)dr["Categories"];
                        modelHome.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelHome.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                        modelHome.HomeOwnerID = Convert.ToInt32(dr["HomeOwnerID"]);
                        modelHome.OwnerName = (string)dr["OwnerName"];
                        modelHome.OwnerEmail = (string)dr["OwnerEmail"];
                        modelHome.OwnerMobile = (string)dr["OwnerMobile"];
                        modelHome.Password = (string)dr["Password"];
                        DropDownByStateForCity(Convert.ToInt32(dr["StateID"]), list2);

                    }

                    return View("HomeAddEdit", modelHome);
                }
            }
            return View("HomeAddEdit");
        }

        #endregion

        #region Save

        public IActionResult HomeSave(HomeModel modelHome)
        {

            if (modelHome.File != null)
            {
                string FilePath = "wwwroot\\Upload\\HomeImages";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, modelHome.File.FileName);
                modelHome.Logo = FilePath.Replace("wwwroot\\", "/") + "/" + modelHome.File.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    modelHome.File.CopyTo(stream);
                }

            }


            if (modelHome.HomeID == 0 && modelHome.HomeOwnerID == 0)
            {
                DataTable dt = dalHome.dbo_PR_Home_And_HomeOwner_Insert(modelHome);
                TempData["HomeInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalHome.dbo_PR_Home_UpdateByPK(modelHome);
                TempData["HomeUpdateMsg"] = "Record Updated Successfully";
            }



            return RedirectToAction("HomeAdd");

        }
        #endregion

        #region "Dropdown"





        public IActionResult DropDownByStateForCity(int StateID, List<City_DropDownModel> city_list)
        {
            USER_DAL dal = new USER_DAL();
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

        #region Dish List
        public IActionResult DishList(int HomeID)
        {
            if (HomeID != null)
            {
                DataTable dt = dalHome.dbo_PR_Dish_SelectAll(HomeID);
                return View("DishList", dt);
            }
            return RedirectToAction("HomeList");

        }
        #endregion

    }
}
