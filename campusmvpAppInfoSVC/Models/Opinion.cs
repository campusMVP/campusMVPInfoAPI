namespace campusmvpAppInfoSVC.Models
{
    public class Opinion
    {
        public string Description { get; set; }
        public string Author { get; set; }

        public static Opinion Map(DAL.Opinion opi)
        {
            if (opi == null)
                return new Opinion();
            else
                return new Opinion()
                {
                    Description = opi.Description,
                    Author = opi.Author
                };
        }
    }
}
