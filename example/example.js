if (Meteor.isClient) {
  Template.hello.greeting = function () {
    return asdas;
  };

  Template.hello.events({
    'click #test': function (e,tmpl) {
      
      }
  });
}


if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}
