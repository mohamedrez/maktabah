Survey.StylesManager.applyTheme("defaultV2");

var surveyJSON = {"title":"Rails Test","logoPosition":"right","pages":[{"name":"page1","elements":[{"type":"radiogroup","name":"question1","correctAnswer":"Item 1","isRequired":true,"choices":[{"value":"Item 1","text":"nbr =  45"},{"value":"Item 2","text":"var nbr = 45"},{"value":"Item 3","text":"nbr(45)"}]}],"questionTitleLocation":"hidden","title":"How you declare a variable?"},{"name":"page2","elements":[{"type":"radiogroup","name":"question2","correctAnswer":"Item 2","isRequired":true,"choices":[{"value":"Item 2","text":"method_name"},{"value":"Item 3","text":"MethodName"},{"value":"Item 4","text":"methodName"}]}],"questionTitleLocation":"hidden","title":"How you declare a method name?"},{"name":"page3","elements":[{"type":"radiogroup","name":"question3","correctAnswer":"Item 4","isRequired":true,"choices":[{"value":"Item 2","text":"{age:  45}"},{"value":"Item 3","text":"{:age => 45}"},{"value":"Item 4","text":"all"}]}],"questionTitleLocation":"hidden","title":"which hash format correct?"}]};

function sendDataToServer(survey) {
    //send Ajax request to your web server
    var quizId = window.location.pathname.split('/')[4];
    $.ajax({
        url: '/user_quiz_responses',
        type: "post",
        data: { response: JSON.stringify(survey.data), quiz_id: quizId }
    });
}

var survey = new Survey.Model(surveyJSON);
$("#surveyContainer").Survey({
    model: survey,
    onComplete: sendDataToServer
});