using System.IO;
using System.Threading.Tasks;
using ImageMagick;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting; 

namespace imageresizer.Controllers
{ 
    public partial class ImagesController : ControllerBase 
    {
        [HttpGet("api/images")]
        public async Task<IActionResult> GetImage(
            [FromQuery]string name,

            [FromServices]IHostEnvironment env
        ) 
        {
            var filePath = Path.Combine(env.ContentRootPath, "Images", name);
            var fileExists = System.IO.File.Exists(filePath);
            if (!fileExists)
                return NotFound();

            var fileBytes = await System.IO.File.ReadAllBytesAsync(filePath);
            return File(fileBytes, "image/jpeg");
        }
    }
}