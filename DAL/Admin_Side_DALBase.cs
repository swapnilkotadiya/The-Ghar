﻿using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.BALAdmin;
using System.Reflection;

namespace The_Ghar.DAL
{
    public class Admin_Side_DALBase : DALHelper
    {
        #region City Select All
        public DataTable dbo_PR_City_SelectAll_By_Admin(int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_City_SelectAll_By_Admin");
                sqlDB.AddInParameter(dbCmd, "AdminID", SqlDbType.Int, CV.AdminID());
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region State Select All
        public DataTable dbo_PR_State_SelectAll_By_Admin(int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_State_SelectAll_By_Admin");
                sqlDB.AddInParameter(dbCmd, "AdminID", SqlDbType.Int, CV.AdminID());
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Admin Select All
        public DataTable dbo_PR_Admin_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Admin_SelectAll");

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region State Delete
        public DataTable dbo_PR_State_DeleteByPK(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_State_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region State Edit

        public DataTable dbo_PR_State_GetValue_For_Edit(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_State_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, StateID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region State Insert
        public DataTable dbo_PR_State_Insert(StateModel model, int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_State_Insert");
                sqlDB.AddInParameter(dbCmd, "StateName", SqlDbType.NVarChar, model.StateName);
                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "AdminID", SqlDbType.Int, CV.AdminID());

                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region State Update
        public DataTable dbo_PR_State_UpdateByPK(StateModel modelState, int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_State_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelState.StateID);
                sqlDB.AddInParameter(dbCMD, "StateName", SqlDbType.NVarChar, modelState.StateName);

                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, modelState.ModificationDate = null);
                sqlDB.AddInParameter(dbCMD, "AdminID", SqlDbType.Int, CV.AdminID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region City Delete
        public DataTable dbo_PR_City_DeleteByPK(int CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_City_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, CityID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region City Edit

        public DataTable dbo_PR_City_GetValue_For_Edit(int CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_City_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, CityID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region City Insert
        public DataTable dbo_PR_City_Insert(CityModel model, int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_City_Insert");
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, model.StateID);
                sqlDB.AddInParameter(dbCmd, "CityName", SqlDbType.NVarChar, model.CityName);
                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "AdminID", SqlDbType.Int, CV.AdminID());

                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region City Update
        public DataTable dbo_PR_City_UpdateByPK(CityModel modelCity)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_City_UpdateByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelCity.CityID);
                sqlDB.AddInParameter(dbCMD, "CityName", SqlDbType.NVarChar, modelCity.CityName);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelCity.StateID);


                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, modelCity.ModificationDate = null);
                sqlDB.AddInParameter(dbCMD, "AdminID", SqlDbType.Int, CV.AdminID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region State Dropdown
        public DataTable dbo_PR_State_Dropdown()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_State_Dropdown");
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region Admin Delete
        public DataTable dbo_PR_Admin_DeleteByPK(int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Admin_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "AdminID", SqlDbType.Int, AdminID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Admin Edit

        public DataTable dbo_PR_Admin_GetValue_For_Edit(int AdminID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Admin_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "AdminID", SqlDbType.Int, AdminID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Admin Insert
        public DataTable dbo_PR_Admin_Insert(AdminModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Admin_Insert");

                sqlDB.AddInParameter(dbCmd, "Name", SqlDbType.NVarChar, model.Name);
                sqlDB.AddInParameter(dbCmd, "Email", SqlDbType.NVarChar, model.Email);
                sqlDB.AddInParameter(dbCmd, "Password", SqlDbType.NVarChar, model.Name);
                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);



                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Admin Update
        public DataTable dbo_PR_Admin_UpdateByPK(AdminModel modelAdmin)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Admin_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "AdminID", SqlDbType.Int, modelAdmin.AdminID);
                sqlDB.AddInParameter(dbCMD, "Name", SqlDbType.NVarChar, modelAdmin.Name);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelAdmin.Email);
                sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.NVarChar, modelAdmin.Password);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, modelAdmin.ModificationDate = null);



                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Home Select All
        public DataTable dbo_PR_Home_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Home_SelectAll");

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Home Delete
        public DataTable dbo_PR_Home_DeleteByPK(int HomeID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Home_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "HomeID", SqlDbType.Int, HomeID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Home Edit

        public DataTable dbo_PR_Home_GetValue_For_Edit(int HomeID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Home_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "HomeID", SqlDbType.Int, HomeID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Home Insert
        public DataTable dbo_PR_Home_And_HomeOwner_Insert(HomeModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Home_And_HomeOwner_Insert");

                sqlDB.AddInParameter(dbCmd, "HomeName", SqlDbType.NVarChar, model.HomeName);
                sqlDB.AddInParameter(dbCmd, "Email", SqlDbType.NVarChar, model.Email);
                sqlDB.AddInParameter(dbCmd, "AreaLocation", SqlDbType.NVarChar, model.AreaLocation);
                sqlDB.AddInParameter(dbCmd, "Mobile", SqlDbType.NVarChar, model.Mobile);
                sqlDB.AddInParameter(dbCmd, "Logo", SqlDbType.NVarChar, model.Logo);
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, model.StateID);
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, model.CityID);
                sqlDB.AddInParameter(dbCmd, "CostPerPerson", SqlDbType.NVarChar, model.CostPerPerson);
                sqlDB.AddInParameter(dbCmd, "Categories", SqlDbType.NVarChar, model.Categories);

                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "OwnerName", SqlDbType.NVarChar, model.OwnerName);
                sqlDB.AddInParameter(dbCmd, "OwnerEmail", SqlDbType.NVarChar, model.OwnerEmail);
                sqlDB.AddInParameter(dbCmd, "OwnerMobile", SqlDbType.NVarChar, model.OwnerMobile);
                sqlDB.AddInParameter(dbCmd, "Password", SqlDbType.NVarChar, model.Password);


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);



                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Home Update
        public DataTable dbo_PR_Home_UpdateByPK(HomeModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Home_UpdateByPK");

                sqlDB.AddInParameter(dbCmd, "HomeID", SqlDbType.Int, model.HomeID);
                sqlDB.AddInParameter(dbCmd, "HomeOwnerID", SqlDbType.Int, model.HomeOwnerID);
                sqlDB.AddInParameter(dbCmd, "HomeName", SqlDbType.NVarChar, model.HomeName);
                sqlDB.AddInParameter(dbCmd, "Email", SqlDbType.NVarChar, model.Email);
                sqlDB.AddInParameter(dbCmd, "AreaLocation", SqlDbType.NVarChar, model.AreaLocation);
                sqlDB.AddInParameter(dbCmd, "Mobile", SqlDbType.NVarChar, model.Mobile);
                sqlDB.AddInParameter(dbCmd, "Logo", SqlDbType.NVarChar, model.Logo);
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, model.StateID);
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, model.CityID);
                sqlDB.AddInParameter(dbCmd, "CostPerPerson", SqlDbType.NVarChar, model.CostPerPerson);
                sqlDB.AddInParameter(dbCmd, "Categories", SqlDbType.NVarChar, model.Categories);


                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "OwnerName", SqlDbType.NVarChar, model.OwnerName);
                sqlDB.AddInParameter(dbCmd, "OwnerEmail", SqlDbType.NVarChar, model.OwnerEmail);
                sqlDB.AddInParameter(dbCmd, "OwnerMobile", SqlDbType.NVarChar, model.OwnerMobile);
                sqlDB.AddInParameter(dbCmd, "Password", SqlDbType.NVarChar, model.Password);



                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region User Select All
        public DataTable dbo_PR_Users_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Users_SelectAll");

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Home Delete
        public DataTable dbo_PR_Users_DeleteByPK(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Users_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, UserID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Home Edit

        public DataTable dbo_PR_Users_GetValue_For_Edit(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Users_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, UserID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Home Insert
        public DataTable dbo_PR_Users_Insert(UserModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Users_Insert");


                sqlDB.AddInParameter(dbCmd, "Name", SqlDbType.NVarChar, model.Name);
                sqlDB.AddInParameter(dbCmd, "Email", SqlDbType.NVarChar, model.Email);
                sqlDB.AddInParameter(dbCmd, "Password", SqlDbType.NVarChar, model.Password);
                sqlDB.AddInParameter(dbCmd, "Address", SqlDbType.NVarChar, model.Address);
                sqlDB.AddInParameter(dbCmd, "Mobile", SqlDbType.NVarChar, model.Mobile);
                sqlDB.AddInParameter(dbCmd, "LastLoginDate", SqlDbType.DateTime, model.LastLoginDate = null);
                sqlDB.AddInParameter(dbCmd, "RegistrationDate", SqlDbType.DateTime, model.RegistrationDate = null);
                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, model.StateID);
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, model.CityID);


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);



                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Home Update
        public DataTable dbo_PR_Users_UpdateByPK(UserModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Users_UpdateByPK");

                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, model.UserID);
                sqlDB.AddInParameter(dbCmd, "Name", SqlDbType.NVarChar, model.Name);
                sqlDB.AddInParameter(dbCmd, "Email", SqlDbType.NVarChar, model.Email);
                sqlDB.AddInParameter(dbCmd, "Password", SqlDbType.NVarChar, model.Password);
                sqlDB.AddInParameter(dbCmd, "Address", SqlDbType.NVarChar, model.Address);
                sqlDB.AddInParameter(dbCmd, "Mobile", SqlDbType.NVarChar, model.Mobile);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "StateID", SqlDbType.Int, model.StateID);
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, model.CityID);



                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Dish Select All
        public DataTable dbo_PR_Dish_SelectAll(int HomeID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Dish_SelectAll_By_HomeID");
                sqlDB.AddInParameter(dbCmd, "HomeID", SqlDbType.Int, HomeID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Dish Delete
        public DataTable dbo_PR_Dish_DeleteByPK(int DishID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Dish_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "DishID", SqlDbType.Int, DishID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion

        #region Dish Edit

        public DataTable dbo_PR_Dish_GetValue_For_Edit(int DishID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Dish_GetValue_For_Edit");
                sqlDB.AddInParameter(dbCmd, "DishID", SqlDbType.Int, DishID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Dish Insert
        public DataTable dbo_PR_Dish_And_Recipe_Insert(int HomeID, DishModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Home_And_HomeOwner_Insert");
                sqlDB.AddInParameter(dbCmd, "HomeID", SqlDbType.Int, model.HomeID = HomeID);
                sqlDB.AddInParameter(dbCmd, "DishName", SqlDbType.NVarChar, model.DishName);
                sqlDB.AddInParameter(dbCmd, "Description", SqlDbType.NVarChar, model.Description);
                sqlDB.AddInParameter(dbCmd, "Price", SqlDbType.NVarChar, model.Price);
                sqlDB.AddInParameter(dbCmd, "Category", SqlDbType.NVarChar, model.Category);
                sqlDB.AddInParameter(dbCmd, "DishPhoto", SqlDbType.NVarChar, model.DishPhoto);
                sqlDB.AddInParameter(dbCmd, "CreationDate", SqlDbType.DateTime, model.CreationDate = null);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "PrepTime", SqlDbType.NVarChar, model.PrepTime);
                sqlDB.AddInParameter(dbCmd, "CookTime", SqlDbType.NVarChar, model.CookTime);
                sqlDB.AddInParameter(dbCmd, "TotalTime", SqlDbType.NVarChar, model.TotalTime);
                sqlDB.AddInParameter(dbCmd, "Course", SqlDbType.NVarChar, model.Course);
                sqlDB.AddInParameter(dbCmd, "Cuisine", SqlDbType.NVarChar, model.Cuisine);
                sqlDB.AddInParameter(dbCmd, "Ingredients", SqlDbType.NVarChar, model.Ingredients);
                sqlDB.AddInParameter(dbCmd, "VideoURL", SqlDbType.NVarChar, model.VideoURl);

                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        #endregion

        #region Dish Update
        public DataTable dbo_PR_Dish_UpdateByPK(int HomeID, DishModel model)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_Dish_UpdateByPK");

                sqlDB.AddInParameter(dbCmd, "DishID", SqlDbType.Int, model.DishID);
                sqlDB.AddInParameter(dbCmd, "HomeID", SqlDbType.Int, model.HomeID = HomeID);
                sqlDB.AddInParameter(dbCmd, "DishName", SqlDbType.NVarChar, model.DishName);
                sqlDB.AddInParameter(dbCmd, "Description", SqlDbType.NVarChar, model.Description);
                sqlDB.AddInParameter(dbCmd, "Price", SqlDbType.Decimal, model.Price);
                sqlDB.AddInParameter(dbCmd, "Category", SqlDbType.NVarChar, model.Category);
                sqlDB.AddInParameter(dbCmd, "DishPhoto", SqlDbType.NVarChar, model.DishPhoto);
                sqlDB.AddInParameter(dbCmd, "ModificationDate", SqlDbType.DateTime, model.ModificationDate = null);
                sqlDB.AddInParameter(dbCmd, "PrepTime", SqlDbType.NVarChar, model.PrepTime);
                sqlDB.AddInParameter(dbCmd, "CookTime", SqlDbType.NVarChar, model.CookTime);
                sqlDB.AddInParameter(dbCmd, "TotalTime", SqlDbType.NVarChar, model.TotalTime);
                sqlDB.AddInParameter(dbCmd, "Course", SqlDbType.NVarChar, model.Course);
                sqlDB.AddInParameter(dbCmd, "Cuisine", SqlDbType.NVarChar, model.Cuisine);
                sqlDB.AddInParameter(dbCmd, "Ingredients", SqlDbType.NVarChar, model.Ingredients);
                sqlDB.AddInParameter(dbCmd, "VideoURL", SqlDbType.NVarChar, model.VideoURl);

                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }
        #endregion
    }
}
