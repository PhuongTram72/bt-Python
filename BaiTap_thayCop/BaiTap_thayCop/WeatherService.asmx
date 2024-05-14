using System;
using System.Web.Script.Services;
using System.Web.Services;
using System.Net.Http;
using System.Threading.Tasks;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(Conforms To = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class WeatherService : WebService
{
    private static readonly HttpClient client = new HttpClient();

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public async Task<string> GetWeatherData()
    {
        string apiUrl = "http://localhost:8000/weather";
        var response = await client.GetAsync(apiUrl);
        return await response.Content.ReadAsStringAsync();
    }
}
