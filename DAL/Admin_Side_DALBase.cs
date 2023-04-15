using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.BALAdmin;

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

        #region State Update
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
    }
}
