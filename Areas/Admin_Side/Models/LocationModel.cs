namespace The_Ghar.Areas.Admin_Side.Models
{
    public class LocationModel
    {

    }
    public class CityModel
    {
        public int CityID { get; set; }

        public string CityName { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

        public int StateID { get; set; }

        public string? StateName { get; set; }


    }
    public class StateModel
    {
        public int StateID { get; set; }

        public string StateName { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }


    }

}
