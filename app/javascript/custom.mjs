export const external_message = "External module loaded";


function getUserNavBarNotification(callback){
  fetch("/user_notifications/unread_count")
    .then(response => response.json())
    .then(data => {
      console.log(data);
  });
}

export { getUserNavBarNotification };





