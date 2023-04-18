namespace The_Ghar.Areas.Admin_Side.Models
{
    public class DishModel
    {
        public int HomeID { get; set; }
        public string HomeName { get; set; }

        public int DishID { get; set; }
        public int RecipeID { get; set; }
        public string DishName { get; set; }
        public string Description { get; set; }

        public decimal Price { get; set; }

        public string Category { get; set; }

        public string DishPhoto { get; set; }

        public IFormFile File { get; set; }

        public string PrepTime { get; set; }

        public string CookTime { get; set; }

        public string TotalTime { get; set; }

        public string Course { get; set; }

        public string Cuisine { get; set; }

        public string Ingredients { get; set; }

        public string VideoURl { get; set; }

        public DateTime ModificationDate { get; set; }

        public DateTime CreationDate { get; set; }

    }
}
