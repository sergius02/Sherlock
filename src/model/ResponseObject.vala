public class Sherlock.ResponseObject {

    public uint response_code;

    public string status;
    public string country;
    public string country_code;
    public string region;
    public string region_name;
    public string city;
    public string zip;
    public string lat;
    public string lon;
    public string timezone;
    public string isp;
    public string org;
    public string as;
    public string query;

    public ResponseObject (Json.Object root_object, uint response_code) {
        this.response_code = response_code;
        if (response_code == 200 && root_object != null) {
            this.status = root_object.get_string_member ("status");
            this.country = root_object.get_string_member ("country");
            this.country_code = root_object.get_string_member ("countryCode");
            this.region = root_object.get_string_member ("region");
            this.region_name = root_object.get_string_member ("regionName");
            this.city = root_object.get_string_member ("city");
            this.zip = root_object.get_string_member ("zip");
            this.lat = root_object.get_double_member ("lat").to_string ();
            this.lon = root_object.get_double_member ("lon").to_string ();
            this.timezone = root_object.get_string_member ("timezone");
            this.isp = root_object.get_string_member ("isp");
            this.org = root_object.get_string_member ("org");
            this.as = root_object.get_string_member ("as");
            this.query = root_object.get_string_member ("query");
        } else {
            this.status = @"Error code: $response_code";
        }
    }

}
