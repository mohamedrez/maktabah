Survey.StylesManager.applyTheme("defaultV2");

var surveyJSON = document.getElementById("helper").getAttribute("data-surveyjs");

function sendDataToServer(survey) {
    //send Ajax request to your web server
    var quizId = window.location.pathname.split('/')[5];
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