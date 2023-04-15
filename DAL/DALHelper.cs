using Microsoft.AspNetCore.Mvc;

namespace The_Ghar.DAL
{
    public class DALHelper 
    {
        public static string myConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("myConnectionString");
    }
}
