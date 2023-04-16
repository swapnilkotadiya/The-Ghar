namespace The_Ghar.Areas.Admin_Side.Models
{
    public class HomeModel
    {
        public int HomeID { get; set; }

        public string HomeName { get; set; }

        public string Email { get; set; }

        public string AreaLocation { get; set; }

        public string Mobile { get; set; }

        public string Logo { get; set; }

        public int StateID { get; set; }

        public string StateName { get; set; }

        public string CityName { get; set; }

        public int CityID { get; set; }

        public string CostPerPerson { get; set; }

        public string Categories { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

        public int HomeOwnerID { get; set; }

        public string OwnerName { get; set; }

        public string OwnerEmail { get; set; }

        public string OwnerMobile { get; set; }

        public string Password { get; set; }

        public IFormFile File { get; set; }



    }
}
