using System.Net;
using System.Text.Json;
using TesteConsoleApplication.Models;

HttpWebRequest client = (HttpWebRequest)WebRequest.Create("https://api.sampleapis.com/codingresources/codingResources"); 

client.Method = "GET";
client.ContentType = "application/json";
client.Accept = "application/json";
WebResponse webResponse = client.GetResponse();

Stream webStream = webResponse.GetResponseStream();
StreamReader responseReader = new StreamReader(webStream);
string response = responseReader.ReadToEnd();
List<JsonResponse> jsonList = JsonSerializer.Deserialize<List<JsonResponse>>(response);
if(jsonList != null)
{
    List<string> topics = GetOnlyTopics(jsonList);
    foreach (var item in topics)
        Console.WriteLine(item);

}
else 
{     
    Console.WriteLine("No data found");
}

List<string> GetOnlyTopics(List<JsonResponse> jsonResponseList)
{
    List<string> topics = new List<string>();
    foreach (var json in jsonResponseList)
    {
        foreach (var item in json.topics)
            if (!topics.Contains(item))
                topics.Add(item);
    }
    return topics;
}


