using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace The_Ghar.Areas.HomePage.Models
{
    public class HomePageModel
    {
        public int HomeID { get; set; }

       
        [DisplayName("State Name")]
        public int StateID { get; set; }
        
        [DisplayName("City Name")]
        public int CityID { get; set; }
        
        [DisplayName("Categories")]
        public string Categories { get; set; }
        
        public string HomeName { get; set; }
       
        public string AreaLocation { get; set; }
        
        public string CityName { get; set; }
       
        public string StateName { get; set; }
       
        public string CostPerPerson { get; set; }
        
    }
}
