class DayTimeWeather {
  Location? location;
  Current? current;
  Forecast? forecast;

  DayTimeWeather({this.location, this.current, this.forecast});

  DayTimeWeather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  AirQuality? airQuality;

  Current(
      {this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph,
        this.airQuality});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality(
      {this.co,
        this.no2,
        this.o3,
        this.so2,
        this.pm25,
        this.pm10,
        this.usEpaIndex,
        this.gbDefraIndex});

  AirQuality.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usEpaIndex = json['us-epa-index'];
    gbDefraIndex = json['gb-defra-index'];
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  AirQuality? airQuality;

  Day(
      {this.maxtempC,
        this.maxtempF,
        this.mintempC,
        this.mintempF,
        this.avgtempC,
        this.avgtempF,
        this.maxwindMph,
        this.maxwindKph,
        this.totalprecipMm,
        this.totalprecipIn,
        this.totalsnowCm,
        this.avgvisKm,
        this.avgvisMiles,
        this.avghumidity,
        this.dailyWillItRain,
        this.dailyChanceOfRain,
        this.dailyWillItSnow,
        this.dailyChanceOfSnow,
        this.condition,
        this.uv,
        this.airQuality});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    uv = json['uv'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.moonIllumination,
        this.isMoonUp,
        this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;
  AirQuality? airQuality;

  Hour(
      {this.timeEpoch,
        this.time,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.windchillC,
        this.windchillF,
        this.heatindexC,
        this.heatindexF,
        this.dewpointC,
        this.dewpointF,
        this.willItRain,
        this.chanceOfRain,
        this.willItSnow,
        this.chanceOfSnow,
        this.visKm,
        this.visMiles,
        this.gustMph,
        this.gustKph,
        this.uv,
        this.airQuality});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}
