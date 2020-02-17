### Introduction
Use everything we've been discussing to create a weather forecast site using the weather API from the previous lesson. You should be able to search for a specific location and toggle displaying the data in Fahrenheit or Celsius.

You should change the look of the page based on the data, maybe by changing the color of the background or by adding images that describe the weather. (You could even use the Giphy API to find appropriate weather-related gifs and display them). Feel free to use promises or async/await in your code, though you should try to become comfortable with both.

1. Set up a blank HTML document with the appropriate links to your JavaScript and CSS files.
2. Write the functions that hit the API. You're going to want functions that can take a location and return the weather data for that location. For now, just console.log() the information.
3. Write the functions that _process_ the JSON data you're getting from the API and return an object with only the data you require for your app.
4. Set up a simple form that will let users input their location and will fetch the weather info (still just console.log() it).
5. Display the information on your webpage!
6. Add any styling you like!
7. Optional: add a 'loading' component that displays from the time the form is submitted until the information comes back from the API.
8. Push that baby to github and share your solution below!

### Student Solutions
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/javascript/async-apis/project.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [Bollinca's Solution](https://github.com/bollinca/weather-app) - [View in Browser](https://bollinca.github.io/weather-app/)
* [Julio's Solution](https://github.com/julio22b/weather-project) - [View in Browser](https://julio22b.github.io/weather-project/)
* [Zakariye Yusuf's Solution](https://github.com/ZYusuf10/weatherForcast) - [View in Browser](https://zyusuf10.github.io/weatherForcast/)
* [Martink-rsa's Solution](https://github.com/martink-rsa/weather-forecast) - [View in Browser](https://martink-rsa.github.io/weather-forecast/)
* [Learnsometing's Solution](https://github.com/learnsometing/JS-weather-api-app) - [View in Browser](https://learnsometing.github.io/JS-weather-api-app/)
* [Daniel Wesego's Solution](https://github.com/DanielMitiku/weather-app) - [View in Browser](https://danielmitiku.github.io/weather-app)
* [Alain Suarez's Solution](https://gitlab.com/asuar/react-weather) - [View in Browser](https://asuar.gitlab.io/react-weather/)
* [Bojo's Solution](https://github.com/BojoZahariev/Weather-App) - [View in Browser](https://bojozahariev.github.io/Weather-App/)
* [Igorashs's Solution](https://github.com/igorashs/vue-weather-app) - [View in Browser](https://igorashs.github.io/vue-weather-app/)
* [Vedat's Solution](https://github.com/mvedataydin/react-weather) - [View in Browser](https://mvedataydin.github.io/react-weather/)
* [Solodov's Solution](https://github.com/solodov-dev/drops) - [View in Browser](https://solodov-dev.github.io/drops/)
* [John Paul's Solution](https://github.com/Omulosi/weather-app) - [View in Browser](https://omulosi.github.io/weather-app/)
* [Henry M. Kirya's Solution](https://github.com/harrika/oikendi) - [View in Browser](https://sveather.herokuapp.com/index.html)
* [Eljoey's Solution](https://github.com/eljoey/weather-2) - [View in Browser](https://eljoey.github.io/weather-2/)
* [ARaut9's Solution](https://github.com/ARaut9/weather_app) - [View in Browser](https://araut9.github.io/weather_app/)
* [Jason McKee's Solution](https://github.com/jttmckee/vue-weather-app) - [View in Browser](https://jttmckee.github.io/vue-weather-app/)
* [Max Garbers's Solution](https://github.com/bubblebooy/Odin-Javascript/tree/master/weather) - [Live preview](https://bubblebooy.github.io/Odin-Javascript/weather/build/index.html)
* [Roman Alenskiy's Solution](https://github.com/romalenskiy/react-weather) - [Live preview](https://react-weather228.herokuapp.com)
* [nmac's Solution](https://github.com/nmacawile/weather-map) - [View in Browser](https://nmacawile.github.io/weather-map)
* [Javier Machin's Solution](https://github.com/Javier-Machin/react-weather-app) - [View in Browser](https://javier-machin.github.io/react-weather-app/)
* [Waris's Solution](https://github.com/warisz/weather-app) - [View in Browser](https://cdn.rawgit.com/warisz/weather-app/323c36ae/index.html)
* [VladL2C's Solution](https://vladl2c.github.io/weather-api/) - [View in Browser](https://vladl2c.github.io/weather-api/)
* [Tamerlan1993's Solution](https://github.com/Tamerlan1993/hactktoberfest-2018/tree/master/weather-app) - [View in Browser](https://weather-app-vue.netlify.com/)
* [Luján Fernaud's Solution](https://github.com/lujanfernaud/js-weather-compare) - [View in Browser](http://lujanfernaud.com/js-weather-compare/)
* [gregthepeg's Solution](https://github.com/gregthepeg4/weatherapp) - [View in Browser](https://peaceful-dawn-67006.herokuapp.com/)
* [brxck's Solution](https://github.com/brxck/odin-weather) - [View in Browser](http://brockmcelroy.com/odin-weather/)
* [theghall's Promise Solution](https://github.com/theghall/odin-weather) - [theghall's async/await refactor](https://github.com/theghall/odin-weather-alt)
* [Jmooree30's Solution](https://github.com/jmooree30/weather-app) - [View in Browser](https://jmooree30.github.io/weather-app/)
* [Devon's Solution](https://github.com/defitjo/Weather-App) - [View in Browser](https://defitjo.github.io/Weather-App/)
* [hmbeale's Solution](https://github.com/hmbeale/weather) - [View in Browser](http://hmbeale.github.io/weather/)
* [Rémy's Solution](https://codepen.io/beumsk/pen/Xpbyxv) - [View in Browser](https://codepen.io/beumsk/full/Xpbyxv/)
* [Sava's Solution](https://github.com/SavaVuckovic/Weather-App)
* [Mike Smith's Solution](https://github.com/MikeSS281986/City-Weather-Search) - [View in Browser](https://city-weather-search.firebaseapp.com/)
* [Alvaro Sanchez's Solution](https://github.com/heyalvaro/weather.js) - [View in Browser](http://heyalvaro.com/weather.js/)
* [aznafro's Solution](https://github.com/aznafro/goodmorning) - [View in Browser](https://aznafro.github.io/goodmorning/)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/Weather-app) - [View in Browser](https://areebaishtiaq.github.io/Weather-app/)
* [Taylor J's Solution](https://github.com/taylorjohannsen/weather-app) - [View in Browser](https://taylorjohannsen.github.io/weather-app/)
* [Halkim's Solution](https://github.com/halkim44/react-weather-app) - [View in Browser](https://halkim44.github.io/react-weather-app/)
* [JamCry's Solution](https://github.com/jamcry/js-weather-app) - [View in Browser](https://jamcry.github.io/js-weather-app/)
* [Yash Boura's Solution](https://github.com/yashboura303/weatherappReact) - [View in Browser](https://yashweatherapp.netlify.com/)
* [Krzysztof Sordyl's Solution](https://github.com/Verthon/Weather-App) - [View in Browser](https://verthon.github.io/Weather-App/)
* [Aron's Solution](https://github.com/aronfischer/react_weather_app) - [View in Browser](https://aronfischer.github.io/react_weather_app/)
* [Kelvin Liang's Solution](https://github.com/kelvin8773/odin-weather-app) - [View in Browser](https://my-weather-now.netlify.com/)
</details>
