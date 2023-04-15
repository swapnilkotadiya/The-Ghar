using Microsoft.AspNetCore.Mvc;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
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
        #region Home List
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



            return View("HomeAddEdit");

        }
        #endregion

    }
}
