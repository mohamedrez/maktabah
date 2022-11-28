// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"


// Survey.StylesManager.applyTheme("defaultV2");

// var surveyJSON = {"locale":"ar","title":"اختبار شرح نواقض الإسلام","logoPosition":"right","pages":[{"name":"page1","elements":[{"type":"radiogroup","name":"question1","title":" قول الله تعالى: (إن الله يغفر الذنوب جميعا) هل يدخل فيه الشرك؟","isRequired":true,"choices":[{"value":"item1","text":"نعم؛ لأنها في حق من تاب"},{"value":"item2","text":"لا؛ بدليل (إن الله لا يغفر أن يشرك به)"}]},{"type":"radiogroup","name":"question2","title":"المراد بالظلم في قول الله تعالى: (وما للظالمين من أنصار)","isRequired":true,"choicesFromQuestion":"question1","choices":[{"value":"item1","text":"ظلم النفس"},{"value":"item2","text":"الشرك"},{"value":"item3","text":"ظلم الناس"}]}]}]};

// function sendDataToServer(survey) {
//     //send Ajax request to your web server
//     alert("The results are: " + JSON.stringify(survey.data));
// }

// var survey = new Survey.Model(surveyJSON);
// $("#surveyContainer").Survey({
//     model: survey,
//     onComplete: sendDataToServer
// });
