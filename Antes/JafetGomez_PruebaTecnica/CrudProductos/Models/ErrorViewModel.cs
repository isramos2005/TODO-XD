namespace JafetGomez_PruebaTecnica.Models
{
    public class ErrorViewModel
    {
        public string? Code { get; set; }

        public bool ShowCode => !string.IsNullOrEmpty(Code);
    }
}