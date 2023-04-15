using Microsoft.AspNetCore.Mvc;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using The_Ghar.DAL;
using Microsoft.Practices.EnterpriseLibrary.Data;
using The_Ghar.BAL;
using The_Ghar.Areas.User_Login.Models;

namespace The_Ghar.DAL
{
    public class USER_DALBase : DALHelper
    {
        #region Method: dbo_PR_UserLogin_SelectByEmailPassword
        public DataTable dbo_PR_UserLogin_SelectByEmailPassword(string ConnStr, string Email, string Password)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(ConnStr);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_UserLogin_SelectByEmailPassword");
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.VarChar, Email);
                sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.VarChar, Password);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred in dbo_PR_UserLogin_SelectByEmailPassword:");
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                return null;
            }
        }
        #endregion


        #region Method: dbo_PR_Users_Insert
        public DataTable dbo_PR_Users_Insert(User_LoginModel modelUser_Login)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_Users_Insert");

                sqlDB.AddInParameter(dbCMD, "Name", SqlDbType.NVarChar, modelUser_Login.Name);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelUser_Login.Address);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelUser_Login.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelUser_Login.CityID);
                sqlDB.AddInParameter(dbCMD, "Mobile", SqlDbType.NVarChar, modelUser_Login.Mobile);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelUser_Login.Email);
                sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.NVarChar, modelUser_Login.Password);
                sqlDB.AddInParameter(dbCMD, "RegistrationDate", SqlDbType.Date, modelUser_Login.RegistrationDate = null);
                sqlDB.AddInParameter(dbCMD, "LastLoginDate", SqlDbType.Date, modelUser_Login.LastLoginDate = null);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, modelUser_Login.CreationDate = null);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.Date, modelUser_Login.ModificationDate = null);



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

        public DataTable dbo_City_DropdownByStateID(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_DropdownByStateID");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
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

        //#region Method: dbo_PR_UserLogin_SelectByEmailPassword
        //public DataTable dbo_PR_UserLogin_SelectByEmailPassword(string ConnStr, string Email, string Password)
        //{
        //    try
        //    {
        //        SqlDatabase sqlDB = new SqlDatabase(ConnStr);
        //        DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_UserLogin_SelectByEmailPassword");
        //        sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.VarChar, Email);
        //        sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.VarChar, Password);

        //        DataTable dt = new DataTable();
        //        using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
        //        {
        //            dt.Load(dr);
        //        }

        //        return dt;
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine("An error occurred in dbo_PR_UserLogin_SelectByEmailPassword:");
        //        Console.WriteLine(ex.Message);
        //        Console.WriteLine(ex.StackTrace);
        //        return null;
        //    }
        //}
        //#endregion


    }
}
